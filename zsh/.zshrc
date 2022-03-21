# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd notify
unsetopt beep extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vieites/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# CONFIG
export DOTFILES="/home/$USER/.dotfiles"
export HOSTNAME=$(hostname)

if [[ -d /sys/class/backlight/acpi_video0 ]]; then
    BRIGHTNESS="/sys/class/backlight/acpi_video0/brightness"
else
    BRIGHTNESS="/sys/class/backlight/acpi_video0/brightness"
fi
export BRIGHTNESS

if [[ -d /opt/jdk-11.0.13 ]]; then
    export JAVA_HOME="/opt/jdk-11.0.13"
    PATH+=:$JAVA_HOME/bin
fi

if [[ -d /opt/ltex-ls-15.2.0 ]]; then
    export LTEX_HOME="/opt/ltex-ls-15.2.0"
    PATH+=:$LTEX_HOME/bin
fi

if [[ -d /usr/local/go ]]; then
    export GO_HOME="/usr/local/go"
    PATH+=:$GO_HOME/bin
fi

export PATH

source "$DOTFILES/aliases/general.aliases.bash"
source "$DOTFILES/aliases/git.aliases.bash"

# Load Bash It
#source "$BASH_IT"/bash_it.sh

. "$HOME/.cargo/env"

if [[ ! -z $(which colorscript) ]]; then
    colorscript random
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
