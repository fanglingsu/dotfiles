#!/bin/bash
maxbrightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
brightness=$((($maxbrightness * $1) / 100))
if [ "$brightness" -le "$maxbrightness" ]; then
    echo "$brightness" > /sys/class/backlight/intel_backlight/brightness
fi
exit 0
