#!/bin/bash
while true; do
    fan_path=$(find /sys/devices/platform/thinkpad_hwmon/hwmon/ -name 'fan1_input' 2>/dev/null)
    output_file="/tmp/fan_speed"
    if [ -n "$fan_path" ]; then
        fan_speed=$(cat "$fan_path")
        echo "$fan_speed" > "$output_file"
    else
        echo "Error: Fan speed file not found"
    fi
    sleep 5
done
