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
    layout = "master",
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
    auto_group = true,
    group_on_movetoworkspace = true,
    groupbar = {
      -- One-window groups should look like a normal tiled window.
      disable_when_only = true,
    },
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

local function css_side(box, side)
  if type(box) == "number" then
    return box
  end
  if type(box) ~= "table" then
    return 0
  end
  return box[side] or 0
end

local applying_master = false

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

-- Wide enough for a 3:2 master plus two usable side stacks.
local function monitor_is_wide(mon)
  local work_w, work_h, border = monitor_work_area(mon)
  if not work_w then
    return false
  end
  local slot_w = ((work_h - (2 * border)) * 3 / 2) + (2 * border)
  return (slot_w + (2 * MIN_SIDE)) <= work_w
end

local grouping = false

-- On this laptop, keep tiled windows in one tab group so the master is full size.
local function group_tiled_windows(ws)
  if grouping or not ws or ws.special then
    return
  end
  if monitor_is_wide(ws.monitor) then
    return
  end

  local tiled = {}
  for _, win in ipairs(ws:get_windows() or {}) do
    if not win.floating and win.mapped then
      tiled[#tiled + 1] = win
    end
  end
  if #tiled == 0 then
    return
  end

  grouping = true
  local group = tiled[1].group
  if not group then
    hl.dispatch(hl.dsp.group.toggle({ window = tiled[1] }))
    group = tiled[1].group
  end
  if group then
    for i = 2, #tiled do
      if tiled[i].group ~= group then
        group:add(tiled[i])
      end
    end
  end
  grouping = false
end

local function group_narrow_workspaces()
  for _, ws in ipairs(hl.get_workspaces() or {}) do
    group_tiled_windows(ws)
  end
end

local function apply_master_layout()
  if applying_master then
    return
  end

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

  applying_master = true
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
  applying_master = false
end

apply_master_layout()
group_narrow_workspaces()
hl.on("monitor.focused", apply_master_layout)
hl.on("monitor.layout_changed", function()
  apply_master_layout()
  group_narrow_workspaces()
end)
hl.on("config.reloaded", function()
  apply_master_layout()
  group_narrow_workspaces()
end)
hl.on("workspace.active", apply_master_layout)
hl.on("window.open", function(win)
  if win and win.workspace then
    group_tiled_windows(win.workspace)
  end
end)
hl.on("window.move_to_workspace", function(_, ws)
  group_tiled_windows(ws)
end)
