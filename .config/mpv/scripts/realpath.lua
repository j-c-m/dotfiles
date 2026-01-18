-- realpath.lua
-- Exposes mp.get_property("user-data/realpath") as the fully resolved absolute path

local mp = require 'mp'
local utils = require 'mp.utils'

local function resolve_realpath()
    local orig_path = mp.get_property("path")
    if not orig_path or orig_path == "" then
        mp.set_property("user-data/realpath", "")
        return
    end

    -- Skip for remote/URL/UNC protocols (don't resolve those)
    if orig_path:match("^%a+://") or orig_path:match("^//") then
        mp.set_property("user-data/realpath", orig_path)
        return
    end

    local cmd = {"readlink", "-f", "--", orig_path}
    local res = utils.subprocess({
        args = cmd,
        cancellable = false,
        playback_only = false,
    })

    local resolved = orig_path  -- fallback to original if anything fails

    if res.status == 0 and res.stdout and res.stdout ~= "" then
        resolved = res.stdout:gsub("[\n\r]+$", "")  -- trim trailing newline
    else
        -- Rare failure case: log it, but keep going with expand-path as safety net
        mp.msg.warn("readlink -f failed (status " .. (res.status or "nil") .. "), fallback to expand-path")
        resolved = mp.command_native({"expand-path", orig_path})
    end

    mp.set_property("user-data/realpath", resolved)
end

-- Trigger on file load
mp.add_hook("on_load", 50, resolve_realpath)
mp.observe_property("path", "string", function(name, val)
    if val then resolve_realpath() end
end)
