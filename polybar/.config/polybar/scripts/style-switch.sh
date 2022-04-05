#!/usr/bin/env bash

DIR="$HOME/.config/polybar"
SDIR="$DIR/scripts"
ROFI="$SDIR/rofi"

set-style ()
{
    WM=$(wmctrl -m | head -n 1 | awk '{print $2}')

    if  [[ $1 = "--default" ]]; then
        ln -fs "$DIR"/forest/colors.ini "$DIR"/colors.ini 
        ln -fs "$DIR"/forest/colors.rasi "$ROFI"/colors.rasi 
        "$DIR"/launch.sh "$WM"
    elif  [[ $1 = "--dracula" ]]; then
        ln -fs  "$DIR"/dracula/colors.ini "$DIR"/colors.ini
        ln -fs "$DIR"/dracula/colors.rasi "$ROFI"/colors.rasi
        "$DIR"/launch.sh "$WM"
    fi
}

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
-theme $ROFI/styles.rasi \
<<< " Default| Dracula|")"
            case "$MENU" in
                *Default) set-style --default ;;
                *Dracula) set-style --dracula ;;
                *) rofi -theme "$ROFI/message.rasi" -e "Not valid option"
            esac
