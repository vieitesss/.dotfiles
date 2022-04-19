#!/bin/bash

network="$1"

data=$(nmcli | grep " conectado" | wc -l)

if [[ "$data" = "0" ]]; then
    echo "%{F#CACACA}睊 %{F#ffffff}Offline"
else
    net=$(nmcli | grep " conectado" | head -n 1 | awk '{print $4}')
    echo "%{F#CACACA}直 %{F#ffffff}$net"
fi
