local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local package = wibox.widget.textbox()
package.font = beautiful.widget_text
local package_icon = wibox.widget.textbox()
package_icon.font = beautiful.widget_icon
package_icon.text = ""

local pacman_widget = wibox.widget({
	{
		package_icon,
		fg = beautiful.fg_cpu,
		widget = wibox.container.background,
	},
	{
		package,
		fg = beautiful.fg_cpu,
		widget = wibox.container.background,
	},
	spacing = dpi(0),
	layout = wibox.layout.fixed.horizontal,
})

awful.tooltip({
	objects = { pacman_widget },
	mode = "outside",
	align = "right",
	delay_show = 0,
	border_width = dpi(1),
	bg = beautiful.bg_tooltip,
	fg = beautiful.fg_cpu,
	border_color = beautiful.black,
	shape = gears.shape.rectangle,
	font = beautiful.widget_text,
	margins = dpi(8),
	timer_function = function()
		local handle = io.popen("checkupdates")
    if handle then
        local result = handle:read("*a")
        handle:close()
        if result == "" then
            return "No available updates"
        else
            return result
        end
    else
        return "Failed to run checkupdates"
    end
end,
})

watch([[bash -c "checkupdates | wc -l"]], 900, function(_, stdout, _, _, exit_code)
	if exit_code ~= 0 then
		package.text = "Error"
		return
	end

	local updates = tonumber(stdout)
	if updates == 0 then
		package.text = "0"
		return
	end

	package.text = updates
	-- Makes sure the icon doens't shift when single digit
	if updates < 10 then
		package.text = " " .. package.text
	end

	collectgarbage("collect")
end)

return pacman_widget
