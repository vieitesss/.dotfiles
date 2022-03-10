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

IFS=',|:' read -r -a battery_data <<< $(acpi --battery)
echo ${battery_data[1]}

bat_status=$discharging
if [[ $(echo ${battery_data[1]}) == "Charging" ]]; then
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

data="$clock $date       $audio   $wifi   $bat_status${battery_data[2]}"
expr length "$data"
LENGTH=$(($(expr length "$data") * 11))

sed -i -r "s#width.*#width:$LENGTH ;#" $dir/data.rasi

rofi -theme "$dir/data.rasi" -e "$data"
