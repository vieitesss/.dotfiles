#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/scripts"

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
-theme $SDIR/rofi/styles.rasi \
<<< " Default| Dracula|")"
            case "$MENU" in
				*Default) "$SDIR"/styles.sh --default ;;
				*Dracula) "$SDIR"/styles.sh --dracula ;;
            esac
