~/.config/screen_layout.sh
~/.screensaver.sh
compton -b
flameshot
pgrep -u $USER -x nm-applet > /dev/null || (nm-applet &)
amixer -c 0 set Capture 60DB
