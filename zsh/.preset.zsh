#!/usr/bin/env zsh

unalias run-help 2>/dev/null
autoload -Uz run-help

bindkey -e

# [[ $(type starship) ]] && eval "$(starship init zsh)"
# 
# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

autoload -U compinit
compinit