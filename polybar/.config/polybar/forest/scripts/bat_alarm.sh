#!/bin/bash

dir=$HOME/.config/polybar/forest/scripts/rofi

if [[ $(ps aux | grep bat_alarm.* | wc -l) < 3 ]]; then
    while [[ true ]]; do
        battery=$(echo "scale=2; (($(cat /sys/class/power_supply/BAT0/charge_now) * 100)/ $(cat /sys/class/power_supply/BAT0/charge_full))" | bc)

        if [[ $(cat /sys/class/power_supply/BAT0/status) == "Discharging" ]]; then
            if [[ battery < 11 ]]; then
                sed -i -r "s#width.*#width:100px;#" $dir/data.rasi
                rofi -theme $dir/data.rasi -e " 10%"
                sleep 120
            else
                sleep 300
            fi
        else
            sleep 300
        fi
    done
fi
