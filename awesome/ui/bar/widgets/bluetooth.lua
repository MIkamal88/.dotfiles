local beautiful = require("beautiful")
local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gears = require("gears")
local clickable_container = require("ui.bar.widgets.clickable-container")
local dpi = beautiful.xresources.apply_dpi

local checker
local bluetooth_icon = wibox.widget.textbox()
bluetooth_icon.font = beautiful.widget_icon_battery

-- ===================================================================
-- Initialization
-- ===================================================================

local widget = wibox.widget({
	{
		bluetooth_icon,
		fg = beautiful.fg_battery,
		widget = wibox.container.background,
	},
	layout = wibox.layout.fixed.horizontal,
})

local widget_button = clickable_container(wibox.container.margin(widget, dpi(4), dpi(4), dpi(4), dpi(4)))
widget_button:buttons(gears.table.join(awful.button({}, 1, nil, function()
	awful.spawn("blueman-manager", false)
end)))

awful.tooltip({
	objects = { widget_button },
	mode = "outside",
	align = "right",
	delay_show = 1,
	border_width = dpi(1),
	bg = beautiful.bg_tooltip,
	fg = beautiful.fg_battery,
	border_color = beautiful.black,
	shape = gears.shape.rectangle,
	font = beautiful.widget_text,
	margins = dpi(8),
	timer_function = function()
		if checker ~= nil then
			return "Bluetooth is on"
		else
			return "Bluetooth is off"
		end
	end,
})

watch("bluetoothctl show", 5, function(_, stdout)
	-- Check if there  bluetooth
	checker = stdout:match("Powered: yes") -- If 'Powered: yes' string is detected on stdout
	if checker ~= nil then
		bluetooth_icon:set_markup("󰂯")
	else
		bluetooth_icon:set_markup("󰂲")
	end
	collectgarbage("collect")
end, widget)

return widget_button
