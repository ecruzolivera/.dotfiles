local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local vicious = require("vicious")
local dpi = require("beautiful.xresources").apply_dpi

local theme = require("themes.holo.theme")

local widgets = {}

-- Clock
local cpuTemp = wibox.widget.textbox()
cpuTemp.font = theme.font_bold
vicious.register(cpuTemp, vicious.widgets.thermal, "CPU $1°C", 21, "thermal_zone0") -- Updates every 10 seconds for "thermal_zone0"
widgets.cpuTemp = cpuTemp

-- Clock
local clock = wibox.widget.textbox()
clock.font = theme.font_bold
vicious.register(clock, vicious.widgets.date, "%a, %b %d - %I:%M %p", 60) -- Updates every minute
widgets.clock = clock

-- Disk
local disk = wibox.widget.textbox()
disk.font = theme.font_bold
vicious.register(disk, vicious.widgets.fs, function(_, args)
  -- local root_used = gears.debug.dump_return(args["{/ used_p}"])
  local used = args["{/ used_p}"]
  local status_str = "HDD " .. used .. "%"
  if used >= 95 then
    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "HDD",
      text = "Low space",
    })
  end
  return status_str
end, 62)
widgets.disk = disk

-- Battery
local bat = wibox.widget.textbox()
bat.font = theme.font_bold
vicious.register(bat, vicious.widgets.bat, function(_, args)
  local state = args[1]
  local charge = args[2]
  local status_str = "BAT " .. state .. " " .. charge .. "%"
  if charge <= 10 and state == "-" then
    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Battery",
      text = "Low Battery level",
    })
  end
  return status_str
end, 61, "BAT0")

bat:connect_signal("mouse::enter", function()
  local battery_status = vicious.widgets.bat({}, "BAT0")
  local state = battery_status[1]
  if state ~= "-" then
    return
  end
  local remaining_time = battery_status[3]
  naughty.notify({ text = "Remaining: " .. remaining_time })
end)
widgets.bat = bat

-- CPU
local cpu = wibox.widget.textbox()
cpu.font = theme.font_bold
vicious.cache(vicious.widgets.cpu)
vicious.register(cpu, vicious.widgets.cpu, "CPU $1%", 4)
widgets.cpu = cpu

-- Mem
local memory = wibox.widget.textbox()
memory.font = theme.font_bold
vicious.cache(vicious.widgets.mem)
vicious.register(memory, vicious.widgets.mem, "MEM $1%", 3)
widgets.memory = memory

-- volume
local volume = wibox.widget.textbox()
volume.font = theme.font_bold
vicious.register(volume, vicious.widgets.volume, function(_, args)
  -- local vol_val =
  local vol_val = args[1]
  local state = args[2]
  if state == "🔉" then
    return "VOL " .. vol_val .. "%"
  else
    return "VOL Muted"
  end
end, 2, "Master")

volume:buttons(gears.table.join(
  awful.button({}, 1, function()
    awful.util.spawn("amixer -q set Master toggle", false)
  end),
  awful.button({}, 3, function()
    awful.util.spawn("ghostty -e alsamixer", true)
  end),
  awful.button({}, 4, function()
    awful.util.spawn("amixer -q set Master 5%+", false)
  end),
  awful.button({}, 5, function()
    awful.util.spawn("amixer -q set Master 5%-", false)
  end)
))

widgets.volume = volume

-- Weather
--[[ to be set before use
theme.weather = lain.widget.weather({
    --APPID =
    city_id = 2643743, -- placeholder (London)
    notification_preset = { font = "Monospace 9", position = "bottom_right" },
})
--]]

-- Separators
--
local spacer = wibox.widget({
  {
    widget = wibox.widget.separator,
    color = theme.bg_normal,
    forced_width = dpi(20), -- Adjust the width of the rectangle
    thickness = dpi(4), -- Adjust the thickness of the rectangle
  },
  valign = "center",
  layout = wibox.container.place,
})

widgets.spacer = spacer

return widgets
