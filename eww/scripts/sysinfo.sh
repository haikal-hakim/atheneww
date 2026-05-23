#!/bin/bash
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f", usage}')
RAM_USED=$(free -m | awk 'NR==2{print $3}')
RAM_TOTAL=$(free -m | awk 'NR==2{print $2}')
RAM_PERCENT=$(free | awk 'NR==2{printf "%.0f", $3/$2*100}')
DISK_USED=$(df -h / | awk 'NR==2{print $3}')
DISK_TOTAL=$(df -h / | awk 'NR==2{print $2}')
DISK_PERCENT=$(df / | awk 'NR==2{printf "%.0f", $3/$4*100}')
BATTERY_PATH=$(ls /sys/class/power_supply/ | grep -i bat | head -1)
BATTERY=$(cat /sys/class/power_supply/$BATTERY_PATH/capacity 2>/dev/null || echo 0)
BATTERY_STATUS=$(cat /sys/class/power_supply/$BATTERY_PATH/status 2>/dev/null || echo "Unknown")

echo "{\"cpu\": $CPU, \"ram_used\": $RAM_USED, \"ram_total\": $RAM_TOTAL, \"ram_percent\": $RAM_PERCENT, \"disk_used\": \"$DISK_USED\", \"disk_total\": \"$DISK_TOTAL\", \"disk_percent\": $DISK_PERCENT, \"battery\": $BATTERY, \"battery_status\": \"$BATTERY_STATUS\"}"
