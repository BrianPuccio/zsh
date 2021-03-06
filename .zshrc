# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify inc_append_history sharehistory
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

# If OS X, use Postgres.app's path

if [[ $(uname) == Darwin ]]; then
    PATH="//Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
fi

# End OS X Postgres.app

# If OS X, use /usr/local/bin for homebrew

if [[ $(uname) == Darwin ]]; then
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

# End OS X path for brew

# If OS X, re-direct help location

if [[ $(uname) == Darwin ]]; then
    unalias run-help
    autoload run-help
    HELPDIR=/usr/local/shre/zsh/helpfiles
fi

# End OS X help path

# IF OS X, activate completions

if [[ $(uname) == Darwin ]]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# End OS X completions

# If OS X, syntax highlighting

if [[ $(uname) == Darwin ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# End OS X syntax highlighting

# If python/django virtual environments are supported, load them

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# End virtual environments

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
alias pipup='pip freeze --local | grep -v "^\-e" | cut -d = -f 1  | xargs pip install -U'
alias pipup3='pip3 list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1  | xargs -n1 pip3 install -U --user'
alias ud='apt-get update'
alias ug='apt-get dist-upgrade'
alias udug='apt-get update && apt-get dist-upgrade'
alias zshrcu='wget -q --no-check-certificate https://github.com/BrianPuccio/zsh/raw/master/.zshrc -O ~/.zshrc'

# Quickly add a group, a user and explictly assign them a gid and uid
function gua() {
    if [[ "$1" != "" && "$2" != "" ]]; then
        groupadd -g $1 $2
        useradd -g $1 -m -s /usr/bin/zsh -u $1 $2
    else
        echo "Provide the number and name, respectively, as arguments."
    fi
}
# Move and Link Back
# Move a directory/file to a new location and immediately link back to it from the original location
# I.e., mv foo bar && ln -s bar foo
# Depends on realpath (or grealpath on Mac OS, available in homebrew's coreutils) to make links use
# absolute paths instead of relative paths
function mlb() {
    if [[ "$1" != "" && "$2" != "" ]]; then
        if [[ $(uname) == Darwin ]]; then
            1=$(grealpath $1)
            2=$(grealpath $2)
        else
            1=$(realpath $1)
            2=$(realpath $2)
        fi
        mv $1 $2 && ln -s $2 $1
    else
        echo "Provide a directory/file to be moved and the new location, respectively, as arguments."
    fi
}

# Source aliases that are not universal

if [[ -f ~/.zshaliases ]]; then
    source ~/.zshaliases
fi
