#!/bin/bash

network="$1"

data=$(nmcli | grep "${network}: " | head -n 1)
status=$(echo "$data" | awk '{print $2}')

if [[ "$status" = "desconectado" ]]; then
    echo "%{F#bd93f8}睊 %{F#ffffff}Offline"
elif [[ "$status" = "conectado" ]]; then
    wifi=$(echo "$data" | awk '{print $4}')
    echo "%{F#bd93f8}直 %{F#ffffff}$wifi"
fi
