# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
unsetopt appendhistory
bindkey -e

# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/brianpuccio/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

# Take care when deleting

setopt no_rm_star_silent

# End of take care when deleting

# Aliases to color terminal output

# The --color option only works in a Linux environment
if [[ $(uname) == Linux ]]; then
    alias ls='ls --color'
fi

# Mac environments will use colors in ls if CLICOLOR is set
if [[ $(uname) == Darwin ]]; then
    export CLICOLOR=1
fi

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# Aliases and functions for common commands

# Because I can never remember how to use tar, tar make and tar extract
alias tarm='tar -czf'
alias tare='tar -xzf'
alias ll='ls -lv --group-directories-first'
alias ud='apt-get update'
alias ug='apt-get dist-upgrade'
alias udug='apt-get update && apt-get dist-upgrade'
# Quickly add a group, a user and explictly assign them a gid and uid
function gua() {
    if [[ "$1" != "" && "$2" != "" ]]; then
        groupadd -g $1 $2
        useradd -g $1 -m -s /usr/bin/zsh -u $1 $2
    else
        echo "Provide the number and name, respectively, as arguments."
    fi
}
alias uz='wget -q --no-check-certificate https://github.com/BrianPuccio/zsh/raw/master/.zshrc -O ~/.zshrc'

# Source aliases that are not universal

if [[ -f ~/.zshaliases ]]; then
    source ~/.zshaliases
fi
