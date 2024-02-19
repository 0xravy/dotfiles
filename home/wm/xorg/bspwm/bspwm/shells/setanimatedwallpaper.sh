#!/bin/sh
#Az : Set a video as wallpaper and send the wallpaper link to ressources/awall for startup
killall xwinwrap > /dev/null 2>&1
xwinwrap -g 1920x1080+0+0 -ovr -ni -- mpv --fullscreen --no-stop-screensaver --loop --no-audio --no-border --no-osc --no-osd-bar --no-input-default-bindings -wid WID "$1" > /dev/null 2>&1 &
echo $(readlink -f $1) > ~/scripts/ressources/awall

