# dotfiles

```bash
:CocInstall 
    coc-sh
    coc-java
    coc-json
    coc-clangd
    coc-lua
```

```bash
for folder in this_repo
    stow $folder
done
```

Brightness:

Si no va el brillo, crear un link al directorio /sys/class/backlight/.../brightness, con nombre "brightness"

Cambio de idioma:

ibus-setup
ibus-daemon

Hace falta reiniciar

Fuentes:

Clonar https://github.com/powerline/fonts.git --depth=1 e instalar las fuentes con fonts/install.sh

NVIM:

versión de NodeJS (IMPORTANTE)
pip3 install neovim-remote -> para vim-floaterm
