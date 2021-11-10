#!/bin/bash

packages=(texlive texlive-full zathura latexmk)
for i in ${packages[@]}
do
    if hash $i 2>/dev/null; then
        printf "$i ALREADY EXISTS"
    else
        printf "\nINSTALLING $i\n"
        sleep 2
        sudo apt install $i -y
    fi
done
