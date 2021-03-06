#!/bin/bash

if [[ $(hostname) == "macbookpro" ]]; then
    ~/.mac.sh &
else
    ~/.screen_layout.sh &
fi
~/.screensaver.sh &
compton -b &
flameshot &
amixer set Capture 100% &
pgrep -u $USER -x nm-applet > /dev/null || (nm-applet &)
ibus-daemon &
dunst &

sudo chmod 666 "/sys/class/leds/apple::kbd_backlight/brightness"
sudo chmod 666 "/sys/class/backlight/acpi_video0/brightness"
