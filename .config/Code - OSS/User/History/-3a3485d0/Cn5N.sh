#!/bin/bash

# Launch main Wofi (apps) window
wofi --show drun --width 400 --height 300 &

# Optional: wait a bit to avoid overlap
sleep 0.3

# Show power menu with buttons
choice=$(wofi --show dmenu --prompt "Power options:" --width 400 --height 60 <<EOF
Shutdown
Reboot
Log Out
Sleep
EOF
)

# React to user choice
case "$choice" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  "Log Out") hyprctl dispatch exit ;;  # or your WM's logout command
  Sleep) systemctl suspend ;;
  *) ;;  # Do nothing if cancelled or invalid
esac
