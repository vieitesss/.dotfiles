#!/bin/bash

# ["package name"]="command"
declare -A packages=(
["stow"]="stow" 
["vim"]="vim" 
["lua5.3"]="lua5.3" 
["curl"]="curl"
["nodejs"]="nodejs" 
["tmux"]="tmux"
["flameshot"]="flameshot"
["compton"]="compton"
["npm"]="npm"
["exa"]="exa"
["fd-find"]="fdfind"
["rofi"]="rofi"
["tty-clock"]="tty-clock"
["polybar"]="polybar"
)

function installed(){
    printf "%-10s ALREADY EXISTS\n" "$1"
}

for i in ${!packages[@]}
do
    existe=$(which ${packages[$i]})
    if [[ -z $existe ]]; then 
        printf "\nINSTALLING $i\n"
        sleep 2
        sudo apt install ${packages[$i]} -y
    else
        installed "$i"
    fi
done

if [[ -z $(which nvim) || $(nvim --version | head -n 1) != "NVIM v0.5.1" ]]; then
    wget "https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage"
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim
else
    installed "nvim 0.5.1"
fi

if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
    printf "\nINSTALLING packer"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvimelse
else
    installed "vim-plug"
fi

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    printf "\nINSTALLING tmux plugin manager\n"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    installed "tpm"
fi

if [[ -z $(which starship) ]]; then
    printf "\nINSTALLING starship\n"
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
else
    installed "starship"
fi

