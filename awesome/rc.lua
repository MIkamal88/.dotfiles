-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")

-- Theme handling library
local themes = {
	"catppuccino",
}

local chosen_theme = themes[1]

beautiful.init(string.format("%s/.config/awesome/theme/%s/theme.lua", os.getenv("HOME"), chosen_theme))

-- This is used later as the default terminal and editor to run.
apps = {
	network_manager = "nm-connection-editor", -- recommended: nm-connection-editor
	launcher = "rofi -modi drun -show drun -theme " .. "~/.config/awesome/theme/rofi.rasi",
	terminal = "kitty",
	editor = os.getenv("EDITOR") or "vim",
	editor_cmd = "kitty" .. " -e " .. "vim",
	browser = "firefox",
}

-- Default modkey.
-- Modkey: Mod4 (Super key) or Mod1 (Alt key)
modkey = "Mod4"

require("awful.autofocus")
-- Focus clients under mouse
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

require("signals")

require("bindings")

require("config")

require("rules")

require("ui")

-- List of apps to run on start-up
local run_on_start_up = {
	"picom  --config " .. "~/.config/awesome/theme/" .. "picom.conf",
}

-- Autostart
awful.spawn.with_shell("~/.config/awesome/autostart.sh", false)

-- Run all the apps listed in run_on_start_up
for _, app in ipairs(run_on_start_up) do
	local findme = app
	local firstspace = app:find(" ")
	if firstspace then
		findme = app:sub(0, firstspace - 1)
	end
	-- pipe commands to bash to allow command to be shell agnostic
	awful.spawn.with_shell(
		string.format("echo 'pgrep -u $USER -x %s > /dev/null || (%s)' | bash -", findme, app),
		false
	)
end

-- Reload config when screen geometry changes
screen.connect_signal("property::geometry", awesome.restart)

