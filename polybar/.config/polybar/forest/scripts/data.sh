#!/bin/bash

dir="$HOME/.config/polybar/forest/scripts/rofi"

battery=$(echo "scale=2; (($(cat /sys/class/power_supply/BAT0/charge_now) * 100)/ $(cat /sys/class/power_supply/BAT0/charge_full))" | bc)

status=""
if [[ $(cat /sys/class/power_supply/BAT0/status) == "Charging" ]]; then
    status=""
fi

IFS=' ' read -r -a date_array <<< $(date)

date=""
for ((i = 1; i < ${#date_array[@]} - 1; i++)); do
    date+="${date_array[i]} "
done

data=" $date    $status ${battery%.*} %"

rofi -theme "$dir/data.rasi" -e "$data"
