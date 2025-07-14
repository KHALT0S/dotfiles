#!/bin/bash

xwinwrap_pid=$(pgrep -f "mpv --no-audio --loop --panscan=1 --fullscreen --no-osc --no-input-default-bindings")
if [ -z "$xwinwrap_pid" ]; then
    xwinwrap -g 1920x1080 -ov -ni -fs -- mpv --no-audio --loop --panscan=1 --fullscreen --no-osc --no-input-default-bindings --vf=lavfi=[noise=c0s=20:c0f=t+u] ~/.config/noise.png &
else
    kill "$xwinwrap_pid"
fi
