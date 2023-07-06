#!/usr/bin/env bash
# wm-autostart.sh
# Launch Apps when AwesomeWM starts.

function run {
	if ! pgrep -f $1; then
		$@ &
	fi
}

# List the apps you wish to run on startup below preceded with "run"

# Policy kit (needed for GUI apps to ask for password)
run lxqt-policykit-agent

# USB managment
run diskie --tray

# xrandr layout for AwesomeWM
run ~/.screenlayout/hdmi-samsung-monitor.sh

# Start compositor
#run picom --experimental-backend

# sxhkd Hotkeys
run sxhkd

# Start Volume Control applet
#run volctl
run volumeicon

# Start Network Manager Applet
run nm-applet

# Set Numlock key to active.
run numlockx

# Pamac system update notifications
# run pamac-tray

# Bluetooth
run blueman-applet
#run blueberry-tray

# Unclutter - (hides mouse pointer after 5 seconds of inactivity)
run unclutter

# Power managment
#run xfsettingsd --daemon

# Power managment
run lxqt-powermanagement

# Redshift screen
# run  redshift -P -O 3200

# Init Apps at startup
run megasync
run slack
run brave

# lock after 10 min
run xset s 600
run xss-lock ~/.local/bin/locker
