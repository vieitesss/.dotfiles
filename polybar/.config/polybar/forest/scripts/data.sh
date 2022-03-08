#!/bin/bash

dir="$HOME/.config/polybar/forest/scripts/rofi"

battery=$(echo "scale=2; (($(cat /sys/class/power_supply/BAT0/charge_now) * 100)/ $(cat /sys/class/power_supply/BAT0/charge_full))" | bc)

IFS=' ' read -r -a date_array <<< $(date)

date=""
for ((i = 1; i < ${#date_array[@]} - 1; i++)); do
    date+="${date_array[i]} "
done

data=" $date     ${battery%.*} %"

rofi -theme "$dir/data.rasi" -e "$data"
