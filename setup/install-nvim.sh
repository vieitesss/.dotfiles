#!/bin/bash

if [[ -z $(which nvim) || $(nvim --version | head -n 1) != "NVIM v0.8.0" ]]; then
    wget "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim
else
    printf "%-10s ALREADY EXISTS\n" "nvim"
fi

if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
    printf "\nINSTALLING packer"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvimelse
else
    printf "%-10s ALREADY EXISTS\n" "packer"
fi
