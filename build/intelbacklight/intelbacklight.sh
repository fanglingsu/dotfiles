#!/bin/bash
brightness=$1
maxbrightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
if [ "$brightness" -le "$maxbrightness" ]; then
    echo "$brightness" > /sys/class/backlight/intel_backlight/brightness
fi
exit 0
