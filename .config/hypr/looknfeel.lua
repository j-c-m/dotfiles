-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
-- hl.config({
--   general = {
--     -- No gaps between windows or borders.
--     gaps_in = 0,
--     gaps_out = 0,
--     border_size = 0,
--
--     -- Change to niri-like side-scrolling layout.
--     layout = "scrolling",
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- hl.config({
--   decoration = {
--     -- Use round window corners.
--     rounding = 8,
--
--     -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
--     dim_inactive = true,
--     dim_strength = 0.15,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
hl.config({
  general = {
    layout = "monocle",
  },

  master = {
    -- New windows join the stack; the focused master stays put.
    new_status = "slave",
    -- Center 3:2 master on screens wide enough for two side stacks.
    -- Narrower screens (this 14" 16:10) fall back to a left split.
    orientation = "center",
    slave_count_for_center_master = 1,
    center_master_fallback = "left",
    always_keep_position = false,
  },

  layout = {
    -- Avoid overly wide single-window layouts on wide screens.
    single_window_aspect_ratio = { 3, 2 },
  },

  group = {
    auto_group = false,
  },
})

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })

-- Size and place the master column for the focused monitor.
-- Monitor width/height are physical pixels; reserved and gaps are logical.
local MIN_SIDE = 400
local LEFT_MFACT = 0.85
-- Diagonal inches from EDID. Master at or above this; monocle below.
local MASTER_MIN_INCHES = 15

local function css_side(box, side)
  if type(box) == "number" then
    return box
  end
  if type(box) ~= "table" then
    return 0
  end
  return box[side] or 0
end

local applying = false

local function monitor_work_area(mon)
  if not mon or not mon.scale or mon.scale <= 0 then
    return nil
  end

  local reserved = mon.reserved or {}
  local gaps = hl.get_config("general.gaps_out")
  local border = hl.get_config("general.border_size")
  if type(border) == "table" then
    border = border.left or 0
  end
  border = tonumber(border) or 0

  local work_w = mon.width / mon.scale
    - css_side(reserved, "left")
    - css_side(reserved, "right")
    - css_side(gaps, "left")
    - css_side(gaps, "right")
  local work_h = mon.height / mon.scale
    - css_side(reserved, "top")
    - css_side(reserved, "bottom")
    - css_side(gaps, "top")
    - css_side(gaps, "bottom")
  if work_w <= 0 or work_h <= 0 then
    return nil
  end
  return work_w, work_h, border
end

local function monitor_inches(mon)
  local w = tonumber(mon and mon.physical_width) or 0
  local h = tonumber(mon and mon.physical_height) or 0
  if w <= 0 or h <= 0 then
    return 0
  end
  return math.sqrt(w * w + h * h) / 25.4
end

local function monitor_is_wide(mon)
  return monitor_inches(mon) >= MASTER_MIN_INCHES
end

local function apply_default_layout(ws)
  if not ws or ws.special or not ws.monitor then
    return
  end
  local want = monitor_is_wide(ws.monitor) and "master" or "monocle"
  local cur = ws.tiled_layout
  if cur == want or (cur ~= "master" and cur ~= "monocle") then
    return
  end
  hl.workspace_rule({ workspace = tostring(ws.id), layout = want })
end

local function apply_all_default_layouts()
  for _, ws in ipairs(hl.get_workspaces() or {}) do
    apply_default_layout(ws)
  end
end

local function apply_master_geometry()
  local mon = hl.get_active_monitor()
  local work_w, work_h, border = monitor_work_area(mon)
  if not work_w then
    return
  end

  local slot_w = ((work_h - (2 * border)) * 3 / 2) + (2 * border)
  local center_ok = (slot_w + (2 * MIN_SIDE)) <= work_w
  local orientation = center_ok and "center" or "left"
  local mfact
  if center_ok or (slot_w + MIN_SIDE) <= work_w then
    mfact = slot_w / work_w
  else
    mfact = LEFT_MFACT
  end
  if mfact < 0.35 then
    mfact = 0.35
  elseif mfact > 0.85 then
    mfact = 0.85
  end

  hl.config({
    master = {
      mfact = mfact,
      orientation = orientation,
      slave_count_for_center_master = center_ok and 1 or 2,
    },
  })

  -- Orientation and mfact stick per-workspace; the global values only
  -- cover new workspaces. Apply both to the current master workspace.
  local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
  if workspace and workspace.tiled_layout == "master" then
    hl.dispatch(hl.dsp.layout(center_ok and "orientationcenter" or "orientationleft"))
    hl.dispatch(hl.dsp.layout(string.format("mfact exact %.4f", mfact)))
  end
end

local function apply_layout(ws)
  if applying then
    return
  end
  applying = true
  if ws then
    apply_default_layout(ws)
  else
    apply_all_default_layouts()
  end
  apply_master_geometry()
  applying = false
end

apply_layout()
hl.on("workspace.created", apply_layout)
hl.on("workspace.move_to_monitor", apply_layout)
hl.on("workspace.active", apply_master_geometry)
hl.on("monitor.focused", apply_master_geometry)
hl.on("monitor.added", function()
  apply_layout()
end)
hl.on("monitor.layout_changed", function()
  apply_layout()
end)
hl.on("config.reloaded", function()
  apply_layout()
end)
