#!/bin/bash

if [[ $(hostname) -eq "macbookpro" ]]; then
    ~/.mac.sh
else
    ~/.screen_layout.sh
fi
~/.screensaver.sh
compton -b
flameshot
amixer set Capture 100%
pgrep -u $USER -x nm-applet > /dev/null || (nm-applet &)
