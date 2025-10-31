if ls /sys/class/power_supply/BAT* &>/dev/null; then
  # This computer runs on a battery
  powerprofilesctl set balanced
else
  # This computer runs on power outlet
  powerprofilesctl set performance
fi
