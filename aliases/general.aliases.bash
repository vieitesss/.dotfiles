# List directory contents
alias ls='exa -l --group-directories-first'
alias sl=ls
alias la='exa -al --group-directories-first'       # Compact view, show hidden

alias s="sudo"
alias install="sudo apt install"
alias remove="sudo apt remove"
alias find="sudo find . -iname" #search from current directory
alias dot="cd $DOTFILES"

# Shortcuts to edit startup files
alias vbrc="vim ~/.bashrc"
alias vrc="vim ~/.config/nvim/init.lua"
alias nvd="cd ~/.config/nvim/"

# colored grep
# Need to check an existing file for a pattern that will be found to ensure
# that the check works when on an OS that supports the color option
if grep --color=auto "a" "${BASH_IT}/"*.md &> /dev/null
then
  alias grep='grep --color=auto'
fi


alias c='clear'
alias k='clear'
alias cls='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias q='exit'

alias irc="${IRC_CLIENT:=irc}"

# Language aliases
alias rb='ruby'
alias py='python'
alias ipy='ipython'

# Pianobar can be found here: http://github.com/PromyLOPh/pianobar/

alias piano='pianobar'

alias ..='cd ..'         # Go up one directory
alias cd..='cd ..'       # Common misspelling for going up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

# Shell History
alias h='history'

# Directory
alias md='mkdir -p'
alias rd='rmdir'

# Shorten extract
alias xt="extract"

# editors
alias vim="nvim"
alias v="nvim"
alias py="python3.9"

# sudo editors
alias svim="sudo vim"
alias snano="sudo nano"

# Display whatever file is regular file or folder
catt() {
  for i in "$@"; do
    if [ -d "$i" ]; then
      ls "$i"
    else
      cat "$i"
    fi
  done
}

# The Bash-it aliases were moved to the `bash-it.aliases.bash` file. The intent of this
# is to keep the script readable and less bloated. If you don't need to use
# the `general` aliases, but you want the Bash-it aliases, you can disable the `general`
# aliases and enable just the ones for Bash-it explicitly:
# bash-it disable alias general
# bash-it enable alias bash-it
# shellcheck source=./bash-it.aliases.bash
#source "$BASH_IT/aliases/available/bash-it.aliases.bash"
