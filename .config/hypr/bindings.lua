-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

local function with_menu_bar_sync(dispatcher)
  return function()
    hl.dispatch(dispatcher)
    if o.sync_menu_bar_for_groups then
      o.sync_menu_bar_for_groups()
    end
  end
end

-- Grouping keys also hide/show the menu bar when the group tab bar appears.
hl.unbind("SUPER + G")
hl.unbind("SUPER + ALT + G")
hl.unbind("SUPER + ALT + LEFT")
hl.unbind("SUPER + ALT + RIGHT")
hl.unbind("SUPER + ALT + UP")
hl.unbind("SUPER + ALT + DOWN")
o.bind("SUPER + G", "Toggle window grouping", with_menu_bar_sync(hl.dsp.group.toggle()))
o.bind("SUPER + ALT + G", "Move active window out of group", with_menu_bar_sync(hl.dsp.window.move({ out_of_group = true })))
o.bind("SUPER + ALT + LEFT", "Move window to group on left", with_menu_bar_sync(hl.dsp.window.move({ into_group = "l" })))
o.bind("SUPER + ALT + RIGHT", "Move window to group on right", with_menu_bar_sync(hl.dsp.window.move({ into_group = "r" })))
o.bind("SUPER + ALT + UP", "Move window to group on top", with_menu_bar_sync(hl.dsp.window.move({ into_group = "u" })))
o.bind("SUPER + ALT + DOWN", "Move window to group on bottom", with_menu_bar_sync(hl.dsp.window.move({ into_group = "d" })))

-- On this laptop, windows are tabbed. Super+M cycles tabs.
-- If there is no group, keep the old master swap for the ultrawide.
o.bind("SUPER + M", "Next tab", function()
  local win = hl.get_active_window()
  if win and win.group and (win.group.size or 0) > 1 then
    hl.dispatch(hl.dsp.group.next())
    return
  end

  local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
  if not workspace or workspace.tiled_layout ~= "master" then
    return
  end
  hl.dispatch(hl.dsp.layout("swapwithmaster master"))
end)

-- SUPER+L was Omarchy's dwindle/scrolling toggle, which could not return
-- to master. Cycle all three instead.
hl.unbind("SUPER + L")
o.bind("SUPER + L", "Cycle workspace layout", os.getenv("HOME") .. "/.config/hypr/scripts/workspace-layout-cycle")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- iCloud Mail instead of HEY (was Email / New email).
-- New email runs on key release so Super/Shift/Alt are not still held
-- when the compose shortcut is injected into the mail window.
hl.unbind("SUPER + SHIFT + E")
hl.unbind("SUPER + SHIFT + ALT + E")
o.bind("SUPER + SHIFT + E", "Email", os.getenv("HOME") .. "/.local/bin/omarchy-webapp-handler-icloud-mail")
o.bind(
  "SUPER + SHIFT + ALT + E",
  "New email",
  os.getenv("HOME") .. "/.local/bin/omarchy-webapp-handler-icloud-mail compose",
  { release = true }
)
