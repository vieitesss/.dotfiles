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
export DOTFILES="/home/vieites/.dotfiles"
export HOSTNAME=$(hostname)
export POLYBAR="dracula"

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
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/sudo.plugin.zsh"

. "$HOME/.cargo/env"

if [[ ! -z $(which colorscript) ]]; then
    colorscript random
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^j' autosuggest-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.dit/*'"
export FZF_CTRL_T_COMMAND="find . -type f -not -path '*/\.dit/*'"
