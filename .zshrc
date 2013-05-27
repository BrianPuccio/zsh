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
