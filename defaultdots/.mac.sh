#!/bin/bash

if [[ "$(xrandr --query | grep " connected " | wc -l)" = 2 ]]; then
    xrandr --output eDP --primary --mode 1920x1200 --pos 1920x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --mode 1920x1080 --pos 0x120 --rotate normal --output DisplayPort-3 --off
else
    xrandr --output eDP --mode 1920x1200 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off
fi
