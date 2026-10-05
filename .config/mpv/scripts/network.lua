-- network.lua
-- Publish user-data/network as "yes" or "no" for the file being opened.
-- Linux reads the mount fstype from /proc/self/mountinfo.
-- macOS calls statfs and treats a clear MNT_LOCAL flag as network.
-- Windows treats a UNC path as network and calls GetDriveTypeW for a drive letter.

local mp = require 'mp'
local utils = require 'mp.utils'

-- Mount-table names. GNU stat -f -c %T prints smb2 for a cifs mount.
local NETWORK_FSTYPE = {
    cifs = true,
    nfs = true,
    nfs4 = true,
    ["fuse.sshfs"] = true,
}

local MNT_LOCAL = 0x00001000

local CP_UTF8 = 65001
local DRIVE_REMOTE = 4
local FILE_READ_ATTRIBUTES = 0x80
local FILE_SHARE_ALL = 0x1 + 0x2 + 0x4
local OPEN_EXISTING = 3
local FILE_FLAG_BACKUP_SEMANTICS = 0x02000000
local VOLUME_NAME_DOS = 0

local function unescape_octal(text)
    return (text:gsub("\\(%d%d%d)", function(digits)
        return string.char(tonumber(digits, 8))
    end))
end

local function under_mount(path, mountpoint)
    if mountpoint == "/" then
        return path:sub(1, 1) == "/"
    end
    return path == mountpoint or path:sub(1, #mountpoint + 1) == mountpoint .. "/"
end

local function linux_fstype(path)
    local file = io.open("/proc/self/mountinfo", "r")
    if not file then
        mp.msg.warn("cannot read /proc/self/mountinfo")
        return nil
    end
    local best_len = -1
    local best = nil
    for line in file:lines() do
        local fields = {}
        for field in line:gmatch("%S+") do
            fields[#fields + 1] = field
        end
        local mountpoint = fields[5]
        local fstype
        for i = 7, #fields - 1 do
            if fields[i] == "-" then
                fstype = fields[i + 1]
                break
            end
        end
        if mountpoint and fstype then
            mountpoint = unescape_octal(mountpoint)
            if #mountpoint >= best_len and under_mount(path, mountpoint) then
                best_len = #mountpoint
                best = fstype
            end
        end
    end
    file:close()
    return best
end

local function linux_is_network(path)
    local fstype = linux_fstype(path)
    if not fstype then
        return false
    end
    return NETWORK_FSTYPE[fstype] == true
end

-- 64-bit struct statfs from macOS <sys/mount.h> (__DARWIN_STRUCT_STATFS64).
-- f_flags is the MNT_LOCAL word. statfs$INODE64 uses this layout; on arm64
-- the unsuffixed statfs symbol is the same struct.
local STATFS_CDEF = [[
    typedef struct { int32_t val[2]; } mpv_fsid_t;
    struct mpv_statfs {
        uint32_t    f_bsize;
        int32_t     f_iosize;
        uint64_t    f_blocks;
        uint64_t    f_bfree;
        uint64_t    f_bavail;
        uint64_t    f_files;
        uint64_t    f_ffree;
        mpv_fsid_t  f_fsid;
        uint32_t    f_owner;
        uint32_t    f_type;
        uint32_t    f_flags;
        uint32_t    f_fssubtype;
        char        f_fstypename[16];
        char        f_mntonname[1024];
        char        f_mntfromname[1024];
        uint32_t    f_flags_ext;
        uint32_t    f_reserved[7];
    };
    int mpv_statfs_inode64(const char *path, struct mpv_statfs *buf) __asm__("statfs$INODE64");
    int mpv_statfs(const char *path, struct mpv_statfs *buf) __asm__("statfs");
]]

local macos_ffi

local function macos_flags(path)
    if macos_ffi == false then
        return nil
    end
    if not macos_ffi then
        local ok, ffi = pcall(require, "ffi")
        if not ok then
            mp.msg.warn("ffi unavailable; cannot detect network mount")
            macos_ffi = false
            return nil
        end
        local cdef_ok, err = pcall(ffi.cdef, STATFS_CDEF)
        if not cdef_ok then
            mp.msg.warn("statfs cdef failed: " .. tostring(err))
            macos_ffi = false
            return nil
        end
        macos_ffi = ffi
    end
    local ffi = macos_ffi
    local buf = ffi.new("struct mpv_statfs")
    local ok, rc = pcall(ffi.C.mpv_statfs_inode64, path, buf)
    if not ok then
        ok, rc = pcall(ffi.C.mpv_statfs, path, buf)
    end
    if not ok then
        mp.msg.warn("statfs symbol is missing")
        return nil
    end
    if rc ~= 0 then
        mp.msg.warn("statfs failed for " .. path)
        return nil
    end
    return tonumber(buf.f_flags)
end

local function flag_set(flags, bit)
    return flags % (bit * 2) >= bit
end

local function macos_is_network(path)
    local flags = macos_flags(path)
    if flags == nil then
        return false
    end
    return not flag_set(flags, MNT_LOCAL)
end

-- kernel32 stdcall. DWORD is 32-bit on both Win32 and Win64.
local WIN_CDEF = [[
    typedef uint32_t DWORD;
    typedef int BOOL;
    typedef void *HANDLE;
    typedef uint16_t WCHAR;
    typedef const WCHAR *LPCWSTR;
    typedef WCHAR *LPWSTR;
    DWORD __stdcall GetDriveTypeW(LPCWSTR lpRootPathName);
    DWORD __stdcall GetFullPathNameW(LPCWSTR lpFileName, DWORD nBufferLength, LPWSTR lpBuffer, LPWSTR *lpFilePart);
    int __stdcall MultiByteToWideChar(unsigned int CodePage, DWORD dwFlags, const char *lpMultiByteStr, int cbMultiByte, LPWSTR lpWideCharStr, int cchWideChar);
    int __stdcall WideCharToMultiByte(unsigned int CodePage, DWORD dwFlags, LPCWSTR lpWideCharStr, int cchWideChar, char *lpMultiByteStr, int cbMultiByte, const char *lpDefaultChar, int *lpUsedDefaultChar);
    HANDLE __stdcall CreateFileW(LPCWSTR lpFileName, DWORD dwDesiredAccess, DWORD dwShareMode, void *lpSecurityAttributes, DWORD dwCreationDisposition, DWORD dwFlagsAndAttributes, HANDLE hTemplateFile);
    DWORD __stdcall GetFinalPathNameByHandleW(HANDLE hFile, LPWSTR lpszFilePath, DWORD cchFilePath, DWORD dwFlags);
    BOOL __stdcall CloseHandle(HANDLE hObject);
]]

local win_state

local function win_api()
    if win_state == false then
        return nil
    end
    if win_state then
        return win_state
    end
    local ok, ffi = pcall(require, "ffi")
    if not ok then
        mp.msg.warn("ffi unavailable; cannot detect network mount")
        win_state = false
        return nil
    end
    local cdef_ok, err = pcall(ffi.cdef, WIN_CDEF)
    if not cdef_ok then
        mp.msg.warn("kernel32 cdef failed: " .. tostring(err))
        win_state = false
        return nil
    end
    local load_ok, k32 = pcall(ffi.load, "kernel32")
    if not load_ok then
        mp.msg.warn("kernel32 is unavailable")
        win_state = false
        return nil
    end
    win_state = { ffi = ffi, k32 = k32 }
    return win_state
end

local function to_backslash(path)
    return (path:gsub("/", "\\"))
end

local function windows_is_unc(path)
    local p = to_backslash(path)
    if p:sub(1, 8):lower() == "\\\\?\\unc\\" then
        return true
    end
    local prefix = p:sub(1, 4):lower()
    if prefix == "\\\\?\\" or prefix == "\\\\.\\" then
        return false
    end
    return p:sub(1, 2) == "\\\\"
end

local function windows_drive_root(path)
    local p = to_backslash(path)
    if windows_is_unc(p) then
        return nil
    end
    local letter = p:match("^\\\\%?\\(%a):") or p:match("^(%a):")
    if not letter then
        return nil
    end
    return letter:upper() .. ":\\"
end

local function utf8_to_wide(api, text)
    local n = api.k32.MultiByteToWideChar(CP_UTF8, 0, text, -1, nil, 0)
    if not n or n <= 0 then
        return nil
    end
    local buf = api.ffi.new("uint16_t[?]", n)
    if api.k32.MultiByteToWideChar(CP_UTF8, 0, text, -1, buf, n) <= 0 then
        return nil
    end
    return buf
end

local function wide_to_utf8(api, wide)
    local n = api.k32.WideCharToMultiByte(CP_UTF8, 0, wide, -1, nil, 0, nil, nil)
    if not n or n <= 0 then
        return nil
    end
    local buf = api.ffi.new("char[?]", n)
    if api.k32.WideCharToMultiByte(CP_UTF8, 0, wide, -1, buf, n, nil, nil) <= 0 then
        return nil
    end
    return api.ffi.string(buf)
end

local function full_path(api, text)
    local wide = utf8_to_wide(api, text)
    if not wide then
        return nil
    end
    local n = tonumber(api.k32.GetFullPathNameW(wide, 0, nil, nil))
    if not n or n <= 0 then
        return nil
    end
    local buf = api.ffi.new("uint16_t[?]", n)
    local wrote = tonumber(api.k32.GetFullPathNameW(wide, n, buf, nil))
    if not wrote or wrote <= 0 or wrote >= n then
        return nil
    end
    return wide_to_utf8(api, buf)
end

local function final_path(api, text)
    local wide = utf8_to_wide(api, text)
    if not wide then
        return nil
    end
    local handle = api.k32.CreateFileW(
        wide,
        FILE_READ_ATTRIBUTES,
        FILE_SHARE_ALL,
        nil,
        OPEN_EXISTING,
        FILE_FLAG_BACKUP_SEMANTICS,
        nil
    )
    if handle == nil or api.ffi.cast("intptr_t", handle) == -1 then
        return nil
    end
    local function finish()
        local n = tonumber(api.k32.GetFinalPathNameByHandleW(handle, nil, 0, VOLUME_NAME_DOS))
        if not n or n <= 0 then
            return nil
        end
        local buf = api.ffi.new("uint16_t[?]", n)
        local wrote = tonumber(api.k32.GetFinalPathNameByHandleW(handle, buf, n, VOLUME_NAME_DOS))
        if not wrote or wrote <= 0 or wrote >= n then
            return nil
        end
        return wide_to_utf8(api, buf)
    end
    local ok, result = pcall(finish)
    api.k32.CloseHandle(handle)
    if not ok then
        return nil
    end
    return result
end

local function drive_type(api, root)
    local wide = utf8_to_wide(api, root)
    if not wide then
        return nil
    end
    return tonumber(api.k32.GetDriveTypeW(wide))
end

local function windows_is_network(path)
    local prepared = to_backslash(path)
    if not windows_is_unc(prepared) and not windows_drive_root(prepared) then
        local api = win_api()
        if api then
            local full = full_path(api, prepared)
            if full then
                prepared = to_backslash(full)
            end
        end
    end
    if windows_is_unc(prepared) then
        return true
    end
    local root = windows_drive_root(prepared)
    if not root then
        return false
    end
    local api = win_api()
    if not api then
        return false
    end
    local kind = drive_type(api, root)
    if kind == DRIVE_REMOTE then
        return true
    end
    if kind == nil or kind == 0 or kind == 1 then
        return false
    end
    local final = final_path(api, prepared)
    if not final then
        return false
    end
    final = to_backslash(final)
    if windows_is_unc(final) then
        return true
    end
    local root2 = windows_drive_root(final)
    if not root2 or root2 == root then
        return false
    end
    return drive_type(api, root2) == DRIVE_REMOTE
end

local function platform()
    local name = mp.get_property("platform")
    if name == "windows" or name == "darwin" or name == "linux" then
        return name
    end
    if jit and jit.os == "Windows" then
        return "windows"
    end
    if jit and jit.os == "OSX" then
        return "darwin"
    end
    return "linux"
end

local function resolve_path(path)
    local res = utils.subprocess({
        args = {"readlink", "-f", "--", path},
        cancellable = false,
        playback_only = false,
    })
    if res and res.status == 0 and res.stdout and res.stdout ~= "" then
        return (res.stdout:gsub("[\n\r]+$", ""))
    end
    local status = res and res.status or "nil"
    mp.msg.warn("readlink -f failed (status " .. tostring(status) .. ")")
    return mp.command_native({"expand-path", path}) or path
end

local function publish(network, detail)
    local value = network and "yes" or "no"
    if detail and detail ~= "" then
        mp.msg.verbose("network=" .. value .. " " .. detail)
    else
        mp.msg.verbose("network=" .. value)
    end
    mp.set_property("user-data/network", value)
end

local function update()
    local path = mp.get_property("path")
    if not path or path == "" or path:match("^%a+://") then
        publish(false)
        return
    end
    if platform() == "windows" then
        publish(windows_is_network(path), path)
        return
    end
    if path:match("^//") then
        publish(false)
        return
    end
    local resolved = resolve_path(path)
    local network = platform() == "darwin" and macos_is_network(resolved) or linux_is_network(resolved)
    publish(network, resolved)
end

mp.add_hook("on_load", 50, update)
mp.observe_property("path", "string", function(_, value)
    if value then update() end
end)
