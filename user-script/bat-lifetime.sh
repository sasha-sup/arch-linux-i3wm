#!/bin/bash

get_battery_info() {
    upower_output=$(upower -d)
    time_to_empty=$(echo "$upower_output" | grep -E 'time to empty' | awk '!seen[$0]++ {gsub(/[^0-9.]/, "", $4); hours=int($4); minutes=int(($4 - hours) * 60); printf "%d:%d\n", hours, minutes}')
    percentage=$(echo "$upower_output" | grep -E 'percentage' | awk '!seen[$0]++ {gsub(/[^0-9.]/, "", $2); print $2}')
    bat_status=$(cat /sys/class/power_supply/BAT0/status)
}

print_battery_status() {
    if [ -n "$percentage" ]; then
        if [ "$percentage" -lt 30 ]; then
            bat_status_display="🪫"
        elif [ "$bat_status" = "Charging" ]; then
            bat_status_display="⚡"
        elif [ "$bat_status" = "Discharging" ]; then
            bat_status_display="🔋"
        else
            bat_status_display="🔋FULL"
        fi
        
        if [ "$bat_status_display" = "🔋FULL" ]; then
            echo "$bat_status_display" > "$bat_output_file"
        else
            echo "$bat_status_display$percentage% ⏳$time_to_empty" > "$bat_output_file"
        fi
    else
        echo "Error!"
    fi
}

bat_output_file=/tmp/bat_status

while true; do
    get_battery_info
    print_battery_status
    sleep 5
done