#!/bin/bash
VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f", $2*100}')
MUTE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")

case "$1" in
percent) echo "$VOL" ;;
icon)
  [ "$MUTE" = "MUTED" ] && echo "󰝟" && exit
  if [ "$VOL" -lt 30 ]; then
    echo "󰕿"
  elif [ "$VOL" -lt 70 ]; then
    echo "󰖀"
  else
    echo "󰕾"
  fi
  ;;
color)
  [ "$MUTE" = "MUTED" ] && echo "#6c7086" && exit
  echo "#cdd6f4"
  ;;
esac
