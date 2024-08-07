#!/bin/bash

resolution="1920x1080"

output=$(xrandr -q)
if echo "$output" | grep -q "DP-2 connected"; then
    connected="DP-2"
elif echo "$output" | grep -q "HDMI-1 connected"; then
    connected="HDMI-1"
else
    connected=""
fi

if [ -n "$connected" ]; then
    if echo "$output" | grep -q "$connected connected [0-9]"; then
        xrandr --output "$connected" --off
    else
        xrandr --output "$connected" --mode "$resolution"
    fi
fi