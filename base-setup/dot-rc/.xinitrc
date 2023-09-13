# Set RU and ES layouts, change with Win+Space
setxkbmap -layout "us,ru" -option "grp:win_space_toggle"

# System tray
while true; do
    # Battery Status
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    
    # WiFi Quality
    wifi=$(iwconfig wlp0s20f3 | grep 'Link Quality' | awk '{print $2}' | sed 's/Quality=//')

    # CPU Usage
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}')

    # RAM Usage
    ram=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

    # Load Average
    loadavg1=$(awk '{print $1}' < /proc/loadavg)
    loadavg5=$(awk '{print $2}' < /proc/loadavg)
    loadavg15=$(awk '{print $3}' < /proc/loadavg)

    # Read CPU temperature
    cpu_temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    cpu_temp=$((cpu_temp / 1000))

    # Clock
    dt=$(date '+%d/%m/%Y %H:%M:%S')

    # Set root name
    xsetroot -name " | Wi-Fi: $wifi | CPU: $cpu | RAM: $ram | Load Avg: $loadavg1,$loadavg5,$loadavg15 | CPU Temp: ${cpu_temp}°C | $dt | Bat: $battery% |"
    # Update interval
    sleep 1
done &

# Run volume icon
volumeicon &
# Run blueman applet
blueman-applet &
# walppeper
feh --bg-scale /home/sasha/Pictures/Wallpapers/914670.jpg &
# fn keys
xbindkeys &
# Start DWM
exec dwm
