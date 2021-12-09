#!/bin/bash

# ["package name"]="command"
declare -A packages=(
["git"]="git" 
["stow"]="stow" 
["vim"]="vim" 
["lua5.3"]="lua5.3" 
["curl"]="curl"
["nodejs"]="nodejs" 
["flameshot"]="flameshot"
["compton"]="compton"
["npm"]="npm"
["tree"]="tree"
["exa"]="exa"
["fd-find"]="fdfind"
["rofi"]="rofi"
["tty-clock"]="tty-clock"
["polybar"]="polybar"
["ripgrep"]="ripgrep"
)

for i in ${!packages[@]}
do
    existe=$(which ${packages[$i]})
    if [[ -z $existe ]]; then 
        printf "\nINSTALLING $i\n"
        sleep 2
        sudo apt install ${packages[$i]} -y
    else
        printf "%-10s ALREADY EXISTS\n" "${packages[$i]}"
    fi
done

exec bash -l
