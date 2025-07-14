#!/bin/bash

# Launch wofi for apps or commands in background
wofi --show drun --width 400 --height 300 &

# Wait a bit for Wofi window to open
sleep 0.2

# Use wofi itself or another minimal menu tool to show power buttons
# Example: launch wofi with power options, small and positioned below main window

wofi --show dmenu --prompt "Power options:" --width 400 --height 60 <<EOF
Shutdown
Reboot
Log Out
Sleep
EOF