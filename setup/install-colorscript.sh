#!/bin/bash

if [[ -z $(which colorscript) ]]; then
    git clone https://gitlab.com/dwt1/shell-color-scripts.git
    cd shell-color-scripts
    rm -rf /opt/shell-color-scripts || return 1
    sudo mkdir -p /opt/shell-color-scripts/colorscripts || return 1
    sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
    sudo cp colorscript.sh /usr/bin/colorscript
else
    printf "%-10s ALREADY INSTALLED\n" "colorscript"
fi
