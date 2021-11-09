#!/bin/bash

# En el pc de casa, ordena los monitores
hostname="$(hostname -I)"
if [[ $hostname =~ "192.168.1.116" ]]; then
    xrandr --output DVI-D-0 --mode 1440x900 --pos 240x0 --rotate normal --output HDMI-0 --primary --mode 1920x1080 --pos 0x900 --rotate normal --output DP-0 --mode 1440x900 --pos 1920x900 --rotate normal --output DP-1 --off
fi
