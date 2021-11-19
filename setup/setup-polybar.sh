#!/bin/bash

# Dirs
FDIR="$HOME/.local/share/fonts"

# Install Fonts
install_fonts() {
	echo -e "\n[*] Installing fonts..."
	if [[ -d "$FDIR" ]]; then
		cp -rf $DOTFILES/fonts/* "$FDIR"
	else
		mkdir -p "$FDIR"
		cp -rf $DOTFILES/fonts/* "$FDIR"
	fi
    echo -e "\nFonts installed."
}

install_fonts
