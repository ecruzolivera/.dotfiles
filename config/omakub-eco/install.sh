#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source check-version.sh

if $RUNNING_GNOME; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0
fi

if $RUNNING_UBUNTU; then
  # Install ubuntu pkgs
  sudo apt update -y && sudo apt upgrade -y
  # shellcheck source=/dev/null
  for ubuntu_pkgs in ./scripts/ubuntu/*.sh; do echo "RUNNING $ubuntu_pkgs ..." && source "$ubuntu_pkgs"; done
  # Install snaps
  # shellcheck source=/dev/null
  for snap in ./scripts/snaps/*.sh; do echo "RUNNING $snap ..." && source "$snap"; done
  sudo apt autoremove
fi

if $RUNNING_GNOME; then
  # Install desktop tools and tweaks
  # shellcheck source=/dev/null
  for gnome_script in ./scripts/gnome/*.sh; do echo "RUNNING $gnome_script ..." && source "$gnome_script "; done

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
fi
