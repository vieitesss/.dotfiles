#!/bin/bash

basedir="/sys/class/backlight/acpi_video0/"

old_brightness=$(sudo more $basedir"brightness")

new_brightness=$(($old_brightness $1))

sudo chmod 666 $basedir"brightness"
echo $new_brightness | sudo tee $basedir"brightness" >/dev/null
