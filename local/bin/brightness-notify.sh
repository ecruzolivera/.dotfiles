#!/usr/bin/env bash

current_brightness=$(brightnessctl g)
max_brightness=$(brightnessctl m)

brightness_percent=$((($current_brightness * 100) / $max_brightness))

notify-send "Brightness $brightness_percent%"
