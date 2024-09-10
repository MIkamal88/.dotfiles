-- Required libraries
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local clickable_container = require("ui.bar.widgets.clickable-container")
local dpi = beautiful.xresources.apply_dpi

local wifi_name = wibox.widget.textbox()
wifi_name.font = beautiful.widget_text
local wifi_icon = wibox.widget.textbox()
wifi_icon.font = beautiful.widget_icon

local wifi_widget = wibox.widget({
	{
		wifi_icon,
		fg = beautiful.fg_wifi,
		widget = wibox.container.background,
	},
	spacing = dpi(0),
	layout = wibox.layout.fixed.horizontal,
})

local widget_button = clickable_container(wibox.container.margin(wifi_widget, dpi(4), dpi(4), dpi(4), dpi(4)))
widget_button:buttons(gears.table.join(awful.button({}, 1, nil, function()
	awful.spawn("nm-connection-editor", false)
end)))

local wifi_tooltip = awful.tooltip({
	objects = { widget_button },
	mode = "outside",
	align = "right",
	delay_show = 1,
	border_width = dpi(1),
	bg = beautiful.bg_tooltip,
	fg = beautiful.fg_wifi,
	border_color = beautiful.black,
	shape = gears.shape.rectangle,
	font = beautiful.widget_text,
	margins = dpi(1),
})

--- update_widget: Updates the WiFi widget with the current network SSID and signal strength.
-- This function selects an icon to represent the WiFi signal strength based on predefined thresholds.
-- It updates the wifi_icon with the chosen symbol and the wifi_name with the SSID of the current network.
-- Additionally, if the wifi_tooltip is available, it sets its text to display the SSID and signal strength.
-- @param ssid The SSID of the current WiFi network.
-- @param signal_strength The signal strength of the current WiFi network, represented as a percentage.
local function update_widget(ssid, signal_strength)
	local wifi_symbol = ""
	if signal_strength == nil then
		signal_strength = 0
	end

	if signal_strength >= 80 then
		wifi_symbol = "󰤨"
	elseif signal_strength >= 60 then
		wifi_symbol = "󰤥"
	elseif signal_strength >= 45 then
		wifi_symbol = "󰤢"
	elseif signal_strength >= 40 then
		wifi_symbol = "󰤟"
	elseif signal_strength >= 20 then
		wifi_symbol = "󰤯"
	else
		wifi_symbol = "󰤮"
	end

	wifi_icon.text = wifi_symbol

	if wifi_tooltip then
		if ssid and signal_strength then
			wifi_tooltip:set_text(" ESSID: " .. ssid .. " \n Signal Strength: " .. signal_strength .. "% ")
		else
			wifi_tooltip:set_text("No WiFi connection")
		end
	end
end

watch([[bash -c "nmcli -t -f active,ssid,signal dev wifi | grep '^yes' | cut -d':' -f2,3"]], 2, function(_, stdout)
	local ssid, signal_strength = stdout:match("(.*):(%d+)")
	signal_strength = tonumber(signal_strength)
	update_widget(ssid, signal_strength)

	collectgarbage("collect")
end)

return widget_button
