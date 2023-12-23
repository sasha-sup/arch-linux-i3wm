xsettingsd &
# Set RU and ES layouts, change with Win+Space
setxkbmap -layout "us,ru" -option "grp:win_space_toggle"
xrandr --output eDP-1 --brightness 1.02 --gamma 0.95:0.95:0.95
systemctl --user import-environment DISPLAY
# Run volume icon
volumeicon &
# Run blueman applet
blueman-applet &
# wallpaper
feh --bg-scale /home/sasha/Pictures/Wallpapers/914670.jpg &
# fn keys
xbindkeys &
# System tray
while true; do
    # Battery Status
    is_charging=$(cat /sys/class/power_supply/AC/online)
    battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ "$is_charging" -eq 1 ]; then
        battery_icon="⚡"
    else
        if [ "$battery_level" -lt 30 ]; then
            battery_icon="🪫"
        else
            battery_icon="🔋"
        fi
    fi
    # WiFi Quality
    wifi=$(iwconfig wlp0s20f3 | grep 'Link Quality' | awk '{print $2}' | sed 's/Quality=//')
    # CPU Usage
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}')
    # RAM Usage
    ram=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
    # Read CPU temperature
    cpu_temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    cpu_temp=$((cpu_temp / 1000))
    # Clock
    dt=$(date '+%d/%m/%Y %H:%M:%S')
    # Set root name
    xsetroot -name " | 🔲 $cpu | 🌡️ ${cpu_temp}°C | RAM: $ram | 📶 $wifi | $battery_icon $battery_level% | 🗓️ $dt "
    # Update interval
    sleep 1
done &
# Start DWM
exec dwm
