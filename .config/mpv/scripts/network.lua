-- network.lua
-- Publish user-data/network as "yes" or "no" for the file being opened.
-- Linux reads the mount fstype from /proc/self/mountinfo.
-- macOS calls statfs and treats a clear MNT_LOCAL flag as network.

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

local ffi_state

local function macos_flags(path)
    if ffi_state == false then
        return nil
    end
    if not ffi_state then
        local ok, ffi = pcall(require, "ffi")
        if not ok then
            mp.msg.warn("ffi unavailable; cannot detect network mount")
            ffi_state = false
            return nil
        end
        local cdef_ok, err = pcall(ffi.cdef, STATFS_CDEF)
        if not cdef_ok then
            mp.msg.warn("statfs cdef failed: " .. tostring(err))
            ffi_state = false
            return nil
        end
        ffi_state = ffi
    end
    local ffi = ffi_state
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

local function is_network(path)
    if jit and jit.os == "OSX" then
        return macos_is_network(path)
    end
    return linux_is_network(path)
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

local function update()
    local path = mp.get_property("path")
    if not path or path == "" or path:match("^%a+://") or path:match("^//") then
        mp.set_property("user-data/network", "no")
        return
    end
    local resolved = resolve_path(path)
    local network = is_network(resolved)
    mp.msg.verbose("network=" .. (network and "yes" or "no") .. " " .. resolved)
    mp.set_property("user-data/network", network and "yes" or "no")
end

mp.add_hook("on_load", 50, update)
mp.observe_property("path", "string", function(_, value)
    if value then update() end
end)
