#!/bin/bash

packages=(stow vim neovim curl nodejs tmux flameshot compton fonts-inconsolata npm exa fd-find rofi tty-clock polybar)
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

if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    printf "\nINSTALLING vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    printf "vim-plug ALREADY EXISTS"
fi

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    printf "\nINSTALLING tmux plugin manager\n"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    printf "tpm ALREADY EXISTS\n"
fi
