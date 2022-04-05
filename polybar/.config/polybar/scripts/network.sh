#!/bin/bash

network="$1"

data=$(nmcli | grep "${network}: " | head -n 1)
status=$(echo "$data" | awk '{print $2}')

if [[ "$status" = "desconectado" ]]; then
    echo "%{F#FBC02D}睊 %{F#ffffff}Offline"
elif [[ "$status" = "conectado" ]]; then
    wifi=$(echo "$data" | awk '{print $4}')
    echo "%{F#FBC02D}直 %{F#ffffff}$wifi"
fi
