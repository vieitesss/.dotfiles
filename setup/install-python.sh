#!/bin/bash

if [[ -z $(which pip3) ]]; then
    sudo apt install python3-pip -y
    pip3 install --user pynvim
else
    printf "pip3 ALREADY EXISTS\n"
fi
