#!/bin/bash

### icons
discharging=""
charging=""
clock=""
online="直"
offline="睊"
volume="墳"
mute="婢"

dir="$HOME/.config/polybar/forest/scripts/rofi"

### battery

battery=$(echo "scale=2; (($(cat /sys/class/power_supply/BAT0/charge_now) * 100)/ $(cat /sys/class/power_supply/BAT0/charge_full))" | bc)

bat_status=$discharging
if [[ $(cat /sys/class/power_supply/BAT0/status) == "Charging" ]]; then
   bat_status=$charging
fi

### date

IFS=' ' read -r -a date_array <<< $(date)

date=""
for ((i = 1; i < ${#date_array[@]} - 1; i++)); do
    date+="${date_array[i]} "
done

### wifi

wifi=$online
wifi_name=$(nmcli | grep wlan0 | head -n 1 | grep -oE '[^ ]+$')
if [[ $wifi_name == "desconectado" ]]; then
    wifi=$offline
else
    wifi+=" $wifi_name"
fi

### audio

audio_per=$(awk -F"[][]" '/%/ { print $2 }' <(amixer -D pulse sget Master) | head -n 1)
number=$(IFS='%' read -ra number <<< $audio_per && echo ${number[0]})

audio_status=$volume
if [[ $number = 0 ]]; then
    audio_status=$mute
fi

audio="$audio_status $audio_per"

# attach data

data="$clock $date       $audio   $wifi   $bat_status ${battery%.*} %"
expr length "$data"
LENGTH=$(($(expr length "$data") * 11))

sed -i -r "s#width.*#width:$LENGTH ;#" $dir/data.rasi

rofi -theme "$dir/data.rasi" -e "$data"
