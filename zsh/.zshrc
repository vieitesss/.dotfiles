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
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

# vi mode
bindkey -v
export KEYTIMEOUT=30

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

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
source "/home/vieites/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/home/vieites/.zsh/sudo.plugin.zsh"
source "/home/vieites/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

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
