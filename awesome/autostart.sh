#!/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

run "feh" --bg-scale ~/Documents/wall_14.png

# Enable second Monitor with Intel GPU Enabled
xrandr --output HDMI-1-0 --mode 3440x1440 --rate 99.98 --right-of eDP-2

# Enables switching to bluetooth Earphones upon connection
pacmd load-module module-switch-on-connect

# Switch Audio to HDMI
pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo
