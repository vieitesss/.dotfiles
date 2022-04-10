#!/bin/bash

alacritty -e "nmtui" &
sleep 0.1
node=$(bspc query -N -n newest)
bspc node -f "$node"
bspc node "$node" -t floating
