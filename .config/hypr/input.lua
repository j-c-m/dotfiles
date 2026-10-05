-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Physical Alt is Super, and physical Win is Alt, except while Dota 2 is
-- focused. The game gets the keys in their printed positions.
local kb_options = "compose:caps,shift:both_capslock_cancel"
local kb_options_desktop = kb_options .. ",altwin:swap_alt_win"

hl.config({
  input = {
    accel_profile = "flat",
    kb_options = kb_options_desktop,
    touchpad = {
      natural_scroll = true
    }
  }
})

local dota_classes = {
  dota2 = true,
  ["dota2.exe"] = true,
  steam_app_570 = true,
}

local function window_is_dota(window)
  if not window then
    return false
  end

  return dota_classes[window.class] or dota_classes[window.initial_class] or false
end

local dota_keymap = false

local function sync_dota_keymap()
  local dota = window_is_dota(hl.get_active_window())
  if dota == dota_keymap then
    return
  end

  dota_keymap = dota
  hl.config({
    ["input.kb_options"] = dota and kb_options or kb_options_desktop,
  })
end

hl.on("window.active", sync_dota_keymap)
hl.on("window.class", sync_dota_keymap)
sync_dota_keymap()
-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- hl.config({
--   input = {
--     -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
--     kb_layout = "us,dk,eu",
--     kb_options = "compose:caps,shift:both_capslock_cancel,grp:alts_toggle",
--
--     -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
--     kb_variant = "intl",
--
--     -- Change speed of keyboard repeat.
--     repeat_rate = 40,
--     repeat_delay = 250,
--
--     -- Start with numlock on by default.
--     numlock_by_default = true,
--
--     -- Increase sensitivity for mouse/trackpad (default: 0).
--     sensitivity = 0.35,
--
--     -- Turn off mouse acceleration (default: adaptive).
--     accel_profile = "flat",
--
--     touchpad = {
--       -- Use natural (inverse) scrolling.
--       natural_scroll = true,
--
--       -- Use two-finger clicks for right-click instead of lower-right corner.
--       clickfinger_behavior = true,
--
--       -- Control the speed of your scrolling.
--       scroll_factor = 0.4,
--
--       -- Enable the touchpad while typing.
--       disable_while_typing = false,
--
--       -- Left-click-and-drag with three fingers.
--       drag_3fg = 1,
--     },
--   },
-- })

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })
