#!/bin/bash
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f", usage}')
RAM_PERCENT=$(free | awk 'NR==2{printf "%.0f", $3/$2*100}')
DISK_PERCENT=$(df / | awk 'NR==2{printf "%.0f", $3/$4*100}')
BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

echo "{\"cpu\": $CPU, \"ram_percent\": $RAM_PERCENT, \"disk_percent\": $DISK_PERCENT, \"battery\": $BATTERY, \"battery_status\": \"$BATTERY_STATUS\"}"
