#!/bin/bash

layout=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ "$layout" = "us" ]; then
    dunstify -a "kblayout" -r 1231 "US"
elif [ "$layout" = "es" ]; then
    dunstify -a "kblayout" -r 1231 "ES"
fi

