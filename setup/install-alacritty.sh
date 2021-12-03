#!/bin/bash

if [[ -z $(which alacritty) ]]; then
    printf "\nINSTALLING alacritty\n"
    #Alacritty installer
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup override set stable
    rustup update stable

    #Dependencies
    sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
    sudo apt install cargo

    #Installing Alacritty
    cargo install alacritty

    #Alacritty repo
    gcl https://github.com/alacritty/alacritty.git /home/$USER/
    cd alacritty
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
else
    printf "%-10s ALREADY INSTALLED\n" "alacritty"
fi

# also install starship

if [[ -z $(which starship) ]]; then
    printf "\nINSTALLING starship\n"
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
else
    printf "%-10s ALREADY INSTALLED\n" "starship"
fi
