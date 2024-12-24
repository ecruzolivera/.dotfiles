#!/usr/bin/env bash
# wm-autostart.sh
# Launch Apps when AwesomeWM starts.

function run {
  if ! pgrep -f $1; then
    $@ &
  fi
}

# List the apps you wish to run on startup below preceded with "run"

# # xrandr layout for AwesomeWM
# run ~/.config/autostart/multimonitor_samsung32.sh

# Policy kit (needed for GUI apps to ask for password)
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# # Notification manager
# run dunst

# USB managment
run udiskie --tray

# Start compositor
#run picom --experimental-backend

# sxhkd Hotkeys
run sxhkd

# Start Network Manager Applet
run nm-applet

# Set Numlock key to active.
run numlockx

# Unclutter - (hides mouse pointer after 5 seconds of inactivity)
run unclutter

# run autorandr --change

~/.config/autostart/multimonitor_samsung32.sh

sleep 2

# Redshift screen
run redshift -P -O 4200

# # Start Volume Control applet
# run volumeicon

# Init Apps at startup
run megasync
run slack
run brave

# lock after 10 min
run xset s 600
run xss-lock ~/.local/bin/locker

# touchpad
run xinput set-prop "Synaptics TM3108-002" "libinput Tapping Enabled" 1
