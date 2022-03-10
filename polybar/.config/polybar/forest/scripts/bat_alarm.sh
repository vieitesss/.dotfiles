#!/bin/bash

dir=$HOME/.config/polybar/forest/scripts/rofi

number=$(ps -ef | grep "bat_alarm.sh" | grep -v grep | wc -l | xargs) 
if [ "$number" -lt "3" ]; then
    while [[ true ]]; do
        IFS=' |%' read -r -a battery_data <<< $(acpi --battery)
        if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Discharging" ]; then
            if [ "${battery_data[3]}" -lt "11" ]; then
                sed -i -r "s#width.*#width:100px;#" $dir/data.rasi
                rofi -theme $dir/data.rasi -e " ${battery_data[3]}%"
                sleep 120
            else
                echo "mayor"
                sleep 300
            fi
        else
            sleep 300
        fi
    done
fi

