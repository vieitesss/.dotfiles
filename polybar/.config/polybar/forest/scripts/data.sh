#!/bin/bash

# icons
discharging=""
charging=""
clock=""
online="直"
offline="睊"

dir="$HOME/.config/polybar/forest/scripts/rofi"

battery=$(echo "scale=2; (($(cat /sys/class/power_supply/BAT0/charge_now) * 100)/ $(cat /sys/class/power_supply/BAT0/charge_full))" | bc)

bat_status=$discharging
if [[ $(cat /sys/class/power_supply/BAT0/status) == "Charging" ]]; then
   bat_status=$charging
fi

IFS=' ' read -r -a date_array <<< $(date)

date=""
for ((i = 1; i < ${#date_array[@]} - 1; i++)); do
    date+="${date_array[i]} "
done

wifi=$online
wifi_name=$(nmcli | grep wlan0 | head -n 1 | grep -oE '[^ ]+$')
if [[ $wifi_name == "desconectado" ]]; then
    wifi=$offline
else
    wifi+=" $wifi_name"
fi

data="$clock $date       $wifi   $bat_status ${battery%.*} %"
expr length "$data"
LENGTH=$(($(expr length "$data") * 11))

sed -i -r "s#width.*#width:$LENGTH ;#" $HOME/.config/polybar/forest/scripts/rofi/data.rasi

rofi -theme "$dir/data.rasi" -e "$data"
