#!/bin/bash

~/.screen_layout.sh
~/.screensaver.sh
compton -b
flameshot
amixer set Capture 100%
pgrep -u $USER -x nm-applet > /dev/null || (nm-applet &)
