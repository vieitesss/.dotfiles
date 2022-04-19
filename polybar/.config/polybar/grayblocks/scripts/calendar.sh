#!/bin/bash

YAD_WIDTH=222  # 222 is minimum possible value
YAD_HEIGHT=160 # 160 is minimum possible value

case "$1" in
    --popup)
        eval "$(xdotool getmouselocation --shell)" #X=mouse_x; Y=mouse_y
        # --posx="$(($X - 100))" --posy="$((Y + 25))" \
        yad --calendar --fixed --close-on-unfocus --no-buttons \
            --width="$YAD_WIDTH" --height="$YAD_HEIGHT" --center \
            --title="calendar" --borders=0 >/dev/null &
        ;;
    *)
        echo "$(date +"%a, %d %b")";;
esac
