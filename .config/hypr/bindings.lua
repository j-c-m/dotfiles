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

o.bind("SUPER + M", "Swap with master", function()
  local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
  if workspace and workspace.tiled_layout == "master" then
    hl.dispatch(hl.dsp.layout("swapwithmaster master"))
  end
end)

-- SUPER+L was Omarchy's dwindle/scrolling toggle. Cycle master, dwindle,
-- and scrolling instead.
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

-- iCloud Calendar instead of HEY (was Calendar).
-- The pattern is the Edge --app class (msedge-www.icloud.com__calendar_-Default).
-- A title match also hits other windows that mention iCloud Calendar.
hl.unbind("SUPER + SHIFT + C")
o.bind(
  "SUPER + SHIFT + C",
  "iCloud Calendar",
  "omarchy-launch-or-focus-webapp 'icloud.com__calendar_' 'https://www.icloud.com/calendar/'"
)

-- Apple Music instead of Spotify (was Music).
-- The pattern is the Edge --app class (msedge-music.apple.com__us_home-Default).
-- The URL has no trailing slash, so the class has no trailing underscore.
-- A title match also hits other windows that mention Apple Music.
hl.unbind("SUPER + SHIFT + M")
o.bind(
  "SUPER + SHIFT + M",
  "Music",
  "omarchy-launch-or-focus-webapp 'music.apple.com__us_home' 'https://music.apple.com/us/home'"
)

-- iCloud Photos instead of Google Photos.
-- The pattern is the Edge --app class (msedge-www.icloud.com__photos_-Default).
-- A title match also hits other windows that mention iCloud Photos.
hl.unbind("SUPER + SHIFT + P")
o.bind(
  "SUPER + SHIFT + P",
  "iCloud Photos",
  "omarchy-launch-or-focus-webapp 'icloud.com__photos_' 'https://www.icloud.com/photos/'"
)

-- Grok on Super+Shift+A (was ChatGPT). ChatGPT moves to Super+Shift+Alt+A (was Grok).
hl.unbind("SUPER + SHIFT + A")
hl.unbind("SUPER + SHIFT + ALT + A")
o.bind("SUPER + SHIFT + A", "Grok", { webapp = "https://grok.com" })
o.bind("SUPER + SHIFT + ALT + A", "ChatGPT", { webapp = "https://chatgpt.com" })

-- Google instead of Signal.
hl.unbind("SUPER + SHIFT + G")
o.bind("SUPER + SHIFT + G", "Google", { webapp = "https://www.google.com" })
