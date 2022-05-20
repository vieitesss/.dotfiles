# Dotfiles

![My desktop](/assets/bspwm-desktop.png)
![My desktop](/assets/bspwm-desktop-gruvbox.png)

These are all of my configurations. They are prepared to work in my workspace, but I am trying to make it run in every computer with Linux.

See [contact](#contact).

# Requirements

All you need if you want to use my configs:

* git
* alacritty
* kitty
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

To make *stow* work as we want, make sure this repo is cloned in your $HOME directory. Now, you only have to run 
```bash
stow [a folder of the repository]
``` 

and it will create a link and all the folder tree in your $HOME directory.

# Software

## Polybar

As statusbar, I personally use [Polybar](https://github.com/polybar/polybar). You can find its configs [here](/polybar/.config/polybar/).

About this, I want to explain how its [launch.sh](/polybar/.config/polybar/launch.sh) works.

The most important thing is the fact that you have to execute the script including two parameters: the name of the bar you want to execute and the theme.

```bash
/path/to/my/polybar/launch.sh [bar_name] [theme]
``` 

I have done it like this because I have configured two different bars, one for bspwm and other for awesomewm (I am not currently using this WM).

So, if you have more than one bar and you want to choose between them, my script will work perfectly for you. If you only have one bar, you could modify the script, changing *$1* with the *name_of_your_bar*, and it should work fine.

The script is also prepared to run a bar per monitor connected (lines 14-21). If you only want one bar, you can change all of those lines with the following:

```bash
polybar --reload [bar_name] -c [/path/to/config.ini] &
``` 

It may not work if you are running polybar for the first time. If that is your case, execute de previous command, but get rid of *--reload*.

# More

I am working on creating READMEs for every software I think it is needed to explain how its configuration works.

For the moment, if you have any doubt, you can ask me through the links I leave [below](#contact).

# Contact

Every help or improvement is welcome. You can contact me through [IG](https://www.instagram.com/vieitesss_/) or [TW](https://twitter.com/vieitesss_/).

If you like my configs, you can give me a star, it helps me a lot and makes me very happy.
