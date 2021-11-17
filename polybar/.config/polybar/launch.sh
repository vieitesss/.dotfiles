#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [[ $(hostname -I) =~ "192.168.1.116" ]]; then
    POLYBAR_MONITOR="HDMI-0"
else
    POLYBAR_MONITOR="eDP1"
fi

polybar mybar &

echo "Polybar launched..."
