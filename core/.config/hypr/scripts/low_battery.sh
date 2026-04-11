#!/bin/sh

while true; do
    battery=$(upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
    if [ "$battery" -le "25" ]; then
        notify-send -t 5000 "Battery is low!"
        sleep 240
    else
        sleep 120
    fi
done
