#!/bin/bash

echo "Checking OS version..."

# Check if the /etc/os-release file exists
if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

# Source the OS release information
source /etc/os-release

# Check if running on Ubuntu and if the version is 24.04 or higher
if [ "$ID" != "ubuntu" ] || ! dpkg --compare-versions "$VERSION_ID" ge "24.04"; then
  echo "$(tput setaf 1)Error: OS requirement not met"
  echo "You are currently running: $ID $VERSION_ID"
  echo "OS required: ubuntu 24.04 or higher"
  echo "Installation stopped."
else
  # If the checks pass, the function can proceed
  echo "$(tput setaf 2)OS requirement met. You are running: $ID $VERSION_ID"
  export RUNNING_UBUNTU=true
fi

# Desktop software and tweaks will only be installed if we're running Gnome
RUNNING_GNOME=$([[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]] && echo true || echo false)
export RUNNING_GNOME
