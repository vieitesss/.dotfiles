#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
MAGENTA='\033[1;35m'
GREY='\033[1;37m'
ORANGE='\033[33m'

trap ctrl_c INT

ctrl_c () {
    printf "${RED}Exiting...${NC}\n"
    tput cnorm; exit 1
}

error () {
    printf "\n${RED}$1${NC}\n"
    tput cnorm
    exit 1;
}

install-basics () {
basics=("kitty" "bat" "cargo" "flameshot" "git" "ibus" "stow" "bspwm" "sxhkd" "curl" "wget" "brightnessctl")

for b in "${basics[@]}"; do
    which $b; if [[ "$(echo $?)" -eq "0" ]]; then
        printf "${BLUE}%-14s ${GREEN}%3s${NC}\n" $b "[V]"
    else
        printf "${BLUE}%-14s ${RED}%3s${NC}\n" $b "[X]"
        printf "${ORANGE}Installing $b... ${NC}\n" $b

        sudo apt install "$b" > /dev/null 2>&1

        if [[ $? != 0 ]]; then
            error "Error installing $b"
        else
            printf "${BLUE}%-14s ${GREEN}%3s${NC}\n" $b "[V]"
        fi
    fi
    sleep 1
done

printf "\n${GREEN}All basics installed!${NC}\n\n"
}

install-rust ()
{
    if ! command -v rustc > /dev/null; then
        printf "${ORANGE}Installing rust... ${NC}\n"
        printf "${GREY}It could take some minutes, please be patient.${NC}\n"
        
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        rustup override set stable
        rustup update stable
    fi
}

install-alacritty () {
    install-rust

    if ! which alacritty > /dev/null; then
        printf "${ORANGE}Installing alacritty dependencies... ${NC}\n"

        apt install cmake pkag-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 > /dev/null 2>&1

        printf "${ORANGE}Installing alacritty... ${NC}\n"

        cargo install alacritty

        git clone https://github.com/alacritty/alacritty.git ~/
        cd alacritty
        cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
        desktop-file-install extra/linux/Alacritty.desktop
        update-desktop-database
    fi

    printf "${BLUE}%-14s ${GREEN}%3s${NC}\n" "alacritty" "[V]"
}

main () {
    tput civis

    install-basics 
    # install-alacritty

    tput cnorm
}

if [[ "$(id -u)" != "0" ]]; then
    printf "${RED}Please run as root${NC}\n"
    exit 0
fi

main
