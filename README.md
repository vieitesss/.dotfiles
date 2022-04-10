# Dotfiles

![My desktop](/assets/bspwm-desktop.png)

These are all of my configurations. They are prepared to work in my workspace, but I am trying to make it run in every computer with Linux.

See [contact](#contact).

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

```bash
git clone https://www.github.com/vieitesss/.dotfiles ~/.dotfiles
```

I am trying to make installation scripts work perfectly. They are stored in the [setup](/setup/) folder.

For now, you can try and run it one by one, choosing those you want, and see if they work.

As I said above, any improvement is welcome.

Once you have everything you need installed, all you need now is [**stow**](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow).

To make stow work as we want, make sure this repo is cloned in your $HOME directory. Now, you only have to run 
```bash
stow [a folder of the repository]
``` 

and it will create a link and all the folder tree in your $HOME directory.

# More

I am working on creating READMEs for every software I think it is needed to explain how its configuration works.

For the moment, if you have any doubt, you can ask me through the links I leave [below](#contact).

# Contact

Every help or improvement is welcome. You can contact me through [IG](https://www.instagram.com/vieitesss_/) or [TW](https://twitter.com/vieitesss_/).

If you like my configs, you can give me a star, it helps me a lot and makes me very happy.
