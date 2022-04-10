# Dotfiles

These are all of my configurations. They are prepared to work in my workspace, but I am trying to make it run in every computer with Linux.

Every help or improvement is welcome. You can contact me through [IG](https://www.instagram.com/vieitesss_/) or [TW](https://twitter.com/vieitesss_/)

If you like my configs, you can give me a star, it makes me very happy and encourage me to keep ge
```bash
for folder in this_repo
    stow $folder
done
```

Brightness:

Si no va el brillo, crear un link al directorio /sys/class/backlight/.../brightness, con nombre "brightness" en el HOME
Lo mismo para el archivo del brillo del teclado /sys/class/leds/.../brightness, con nombre "kbdbrightness"

Cambio de idioma:

ibus-setup
ibus-daemon

Hace falta reiniciar

Fuentes:

Clonar https://github.com/powerline/fonts.git --depth=1 e instalar las fuentes con fonts/install.sh

NVIM:

versión de NodeJS (IMPORTANTE)
pip3 install neovim-remote -> para vim-floaterm

Dunst:

Repositorio de dunst-project en github.
Instalar todas las dependencias posibles.
Al hacer el make, desactivar la variable WAYLAND.
