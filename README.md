# Dotfiles

These are all of my configurations. They are prepared to work in my workspace, but I am trying to make it run in every computer with Linux.

Every help or improvement is welcome. You can contact me through [IG](https://www.instagram.com/vieitesss_/) or [TW](https://twitter.com/vieitesss_/)

If you like my configs, you can give me a star, it helps me a lot and makes me very happy.

# Requirements

All you need if you want to use my configs:

* git
* alacritty
* starship
* stow
* bspwm
* sxhkd
* nvim
* polybar
* dunst
* compton
* awesomewm (I'm not using it, so some things may not work perfectly)
* bat
* exa
* ibus
* flameshot
* python
* cargo
* rust
* nodejs
* brightnessctl

There are many other, but you can take a look to all of the installation guides from the main repositories.

# Installation

'''
git clone https://www.github.com/vieitesss/.dotfiles ~/.dotfiles
'''

I am trying to make installation scripts work perfectly. They are stored in the [setup](./setup)

For now, you can try and run it one by one, choosing those you want, and see if they work.

As I said above, any improvement is welcome.

Once you have everything you need installed, all you need now is [**stow**](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow).

To make stow work as we want, make sure this repo is cloned in your $HOME directory. Now, you only have to run '''stow [**folder of the repository**]''' and it will create a link and all the folder tree in your $HOME directory.

```bash
for folder in this_repo
    stow $folder
done
```

NVIM:

versión de NodeJS (IMPORTANTE)
pip3 install neovim-remote -> para vim-floaterm

Dunst:

Repositorio de dunst-project en github.
Instalar todas las dependencias posibles.
Al hacer el make, desactivar la variable WAYLAND.
