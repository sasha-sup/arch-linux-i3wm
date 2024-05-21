#!/bin/bash
CPU_TRSH=60
MEM_TRSH=70

if_cpu_hot() {
    CPU_TEMP=$(sensors | grep 'Package id 0' | awk '{print $4}' | tr -dc '0-9.')
    PS_CPU=$(ps -eo pid,cmd,%cpu --sort=-%cpu | head -6)

    if [ $(echo "$CPU_TEMP > $CPU_TRSH" | bc) -eq 1 ]; then
        dunstify "🚨 Ps, top 5 CPU processes 🚨" "$PS_CPU"
    fi
}

if_mem_2much() {
    MEM_CHECK=$(free -m | awk 'NR==2 {print ($6/($3+$4))*100}')
    PS_MEM=$(ps -eo pid,cmd,%mem --sort=-%mem | head -6)

    if [ $(echo "$MEM_CHECK > $MEM_TRSH" | bc) -eq 1 ]; then
        dunstify "🚨 Ps, top 5 MEM processes 🚨" "$PS_MEM"
    fi
}

while true; do
    if_cpu_hot
    if_mem_2much
    sleep 60
done
