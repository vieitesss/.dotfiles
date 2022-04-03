#!/bin/bash

icons="/usr/share/icons/custom"

while true; do
    battery=$(acpi --battery | head -1 | awk -F ',' '{print $2}' | sed 's/%//g')
    
    if [[ "$battery" -lt "10" ]]; then
        dunstify -u critical -i lighting-red "Battery low"
    elif [[ "$battery" -eq "100" ]]; then
        dunstify -u normal -i lighting-white "Battery full"
    fi

    sleep 300
done

