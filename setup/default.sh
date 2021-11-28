#!/bin/bash

# ["package name"]="command"
declare -A packages=(
["stow"]="stow" 
["vim"]="vim" 
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

if [[ -z $(which nvim) ]]; then
    wget "https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage"
    sudo mv nvim.appimage /usr/local/bin/nvim
else
    installed "nvim 0.5"
fi

if [[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]]; then
    printf "\nINSTALLING vim-plug"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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

