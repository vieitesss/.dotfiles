#!/bin/bash

if [[ "$1" = "screen" ]]; then
    device=acpi_video0
    declare -i id=5969
elif [[ "$1" = "kb" ]]; then
    device=apple::kbd_backlight
    declare -i id=6779
fi
echo "$device"

current=$(brightnessctl -d "$device" | grep "Current" | awk -F'[()]' '{print $2}' | sed 's/%//g')

if [[ "$1" = "screen" ]]; then
    message="Screen brightness: ${current}%"
    if [[ "$current" -lt "50" ]]; then
        icon="brightness-low"
    else
        icon="brightness-high"
    fi
elif [[ "$1" = "kb" ]]; then
    message="Keyboard brightness: ${current}%"
    if [[ "$current" -eq "0" ]]; then
        icon="cross"
    else
        icon="kb-brightness"
    fi
fi

dunstify -a "$1" -r "$id" -i "$icon" -h int:value:"$current" "$message"
