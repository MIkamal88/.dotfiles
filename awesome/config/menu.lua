-- Required libraries
local menubar = require("menubar")
local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", apps.terminal .. " -e man awesome" },
	{ "edit config", apps.editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

poweroptions = {
	{
		"lock",
		function()
			awful.spawn.with_shell("sleep 1 && ~/.config/awesome/blur-lock.sh", false)
		end,
	},
	{
		"logout",
		function()
			awesome.quit()
		end,
	},
	{
		"reboot",
		function()
			awful.spawn("reboot")
		end,
	},
	{
		"shutdown",
		function()
			awful.spawn("shutdown now")
		end,
	},
}

mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "open terminal", apps.terminal },
		{ "power", poweroptions },
	},
})

-- Menubar configuration
mylauncher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = mymainmenu,
})

-- Set the terminal for applications that require it
menubar.utils.terminal = terminal
