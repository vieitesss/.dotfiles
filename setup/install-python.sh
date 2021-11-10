#!/bin/bash

if hash python3-pip 2>/dev/null; then
    printf "pip3 ALREADY EXISTS"
else
    sudo apt install python3-pip -y
fi
pip3 install --user pynvim
