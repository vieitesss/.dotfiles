#!/bin/bash

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
if hash yarn 2>/dev/null; then
    printf "yarn ALREADY EXISTS"
else
    printf "\nINSTALLING yarn"
    sleep 2
    sudo apt install yarn -y
fi
