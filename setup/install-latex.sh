#!/bin/bash

declare -A packages=(
["texlive"]="tex"
["texlive-full"]="tex"
["zathura"]="zathura"
["latexmk"]="latexmk"
)
for i in ${!packages[@]}
do
    existe=$(which ${packages[$i]})
    if [[ -z $existe ]]; then
        printf "\nINSTALLING $i\n"
        sleep 2
        sudo apt install ${packages[$i]} -y
    else
        printf "%-13s ALREADY EXISTS\n" "$i"
    fi
done
