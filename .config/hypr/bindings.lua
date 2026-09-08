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

-- Super+M cycles the monocle stack, or swaps with master.
o.bind("SUPER + M", "Next window in stack", function()
  local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
  if not workspace then
    return
  end
  if workspace.tiled_layout == "monocle" then
    hl.dispatch(hl.dsp.layout("cyclenext"))
    return
  end
  if workspace.tiled_layout == "master" then
    hl.dispatch(hl.dsp.layout("swapwithmaster master"))
  end
end)

-- Alt+Tab does not cycle monocle windows unless the layout dispatcher is used.
hl.unbind("ALT + TAB")
hl.unbind("ALT + SHIFT + TAB")
o.bind("ALT + TAB", "Focus on next window", function()
  local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
  if workspace and workspace.tiled_layout == "monocle" then
    hl.dispatch(hl.dsp.layout("cyclenext"))
  else
    hl.dispatch(hl.dsp.window.cycle_next())
  end
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
o.bind("ALT + SHIFT + TAB", "Focus on previous window", function()
  local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
  if workspace and workspace.tiled_layout == "monocle" then
    hl.dispatch(hl.dsp.layout("cycleprev"))
  else
    hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
  end
  hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- SUPER+L was Omarchy's dwindle/scrolling toggle. Cycle master, dwindle,
-- scrolling, and monocle instead.
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

-- Apple Music instead of Spotify (was Music).
hl.unbind("SUPER + SHIFT + M")
o.bind(
  "SUPER + SHIFT + M",
  "Music",
  "omarchy-launch-or-focus-webapp 'Apple Music' 'https://music.apple.com/us/home'"
)
