#!/usr/bin/env zsh

# Aliases
alias rm="trash"
alias cp="cp -i"

alias help=run-help

alias v='nvim'
# alias vi='nvim'
export EDITOR='nvim'
alias vz="NVIM_APPNAME=nvim-lazyvim nvim"
alias vc="NVIM_APPNAME=nvim-nvchad nvim"
alias va="NVIM_APPNAME=nvim-astronvim nvim"
alias vl="NVIM_APPNAME=nvim-lunarvim nvim"
alias vk="NVIM_APPNAME=nvim-kickstart nvim"

alias zshconfig="nvim $ZDOTDIR/.zshrc"
# alias vimconfig="nvim ~/.vimrc"
# alias ansibleconfig="nvim ~/.ansible/ansible.cfg"
# alias grep='grep --color=auto'

alias ls="eza -alf --color=always --sort=size | grep -v /"
alias ld='eza -lD'
alias lf='eza -lf --color=always | grep -v /'
alias lh='eza -dl .* --group-directories-first'
alias ll='eza -al --group-directories-first --git --icons -l'
alias lt='eza -al --sort=modified'

#
# alias  kitten ssh
[ "$TERM" = "xterm-kitty" ] && alias kssh="kitten ssh --kitten interpreter=python3"

# Homebrew
alias brew='env PATH="${PATH//.asdf/shims:/}" brew'

alias cat='bat -P --style=plain'

# node.js corepack
alias yarn="corepack yarn"
alias yarnpkg="corepack yarnpkg"
alias dlx="corepack dlx"
alias pnpm="corepack pnpm"
alias pnpx="corepack pnpx"
alias npm="corepack npm"
alias npx="corepack npx"

alias pwall="pwgen -cnys"
alias pwnsym="pwgen -cns"
alias pwctyun="pwgen -cnys -r '\"\\'"
alias pwmvn="pwgen -cnysB -r {}\|\(\)\/\\ 32 1"
