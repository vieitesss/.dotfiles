#!/bin/bash

if [[ -z $(which yarn) ]]; then
    printf "\nINSTALLING yarn"
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt install yarn -y
else
    printf "yarn ALREADY EXISTS\n"
fi
