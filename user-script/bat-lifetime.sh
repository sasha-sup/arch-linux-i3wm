#!/bin/bash

while true; do

    bat_status=$(cat /sys/class/power_supply/BAT0/status)
    bat_output_file=/tmp/bat_status
    time_to_empty=$(upower -d | grep -E 'time to empty' | awk '!seen[$0]++ {gsub(/[^0-9.]/, "", $4); hours=int($4); minutes=int(($4 - hours) * 60); printf "%d:%d\n", hours, minutes}')
    percentage=$(upower -d | grep -E 'percentage' | awk '!seen[$0]++ {gsub(/[^0-9.]/, "", $2); print $2}')

   if [ -n "$percentage" ] && [ -n "$time_to_empty" ]; then
        if [ "$percentage" -lt 30 ]; then
            bat_status_display="🪫"
        elif [ "$bat_status" = "Charging" ]; then
            bat_status_display="⚡"
        elif [ "$bat_status" = "Discharging" ]; then
            bat_status_display="🔋"
        else
            bat_status_display="⚠️"
        fi
        echo "$bat_status_display$percentage% ⏳$time_to_empty" > "$bat_output_file"
    else
        echo "Error!"
    fi

    sleep 5
done
