#!/bin/bash

uptime_info=$(uptime -p)

days=$(echo "$uptime_info" | grep -oP '\d+(?= day)' || echo "0")
hours=$(echo "$uptime_info" | grep -oP '\d+(?= hour)' || echo "0")

formatted_output="⏲ ${days}d\\${hours}h"

echo "$formatted_output" > /tmp/mytime
