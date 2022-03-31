#!/usr/bin/env bash

DIR="$HOME/.config/polybar"
ROFI="$HOME/.config/polybar/scripts/rofi"

if  [[ $1 = "--default" ]]; then
    ln -fs "$DIR"/forest/colors.ini "$DIR"/colors.ini 
    ln -fs "$DIR"/forest/colors.rasi "$ROFI"/colors.rasi 
    "$DIR"/launch.sh > /dev/null
elif  [[ $1 = "--dracula" ]]; then
    ln -fs  "$DIR"/dracula/colors.ini "$DIR"/colors.ini
    ln -fs "$DIR"/dracula/colors.rasi "$ROFI"/colors.rasi
    "$DIR"/launch.sh > /dev/null
else
	cat <<- _EOF_
	No option specified, Available options:
	--default    --dracula
	_EOF_
fi
