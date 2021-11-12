#!/bin/bash

packages=(vim curl nodejs tmux flameshot compton ranger)
for i in ${packages[@]}
do
    if hash $i 2>/dev/null; then
        printf "$i ALREADY EXISTS\n"
    else
        printf "\nINSTALLING $i\n"
        sleep 2
        sudo apt install $i -y
    fi
done

printf "\nINSTALLING vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "\nINSTALLING tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
