#!/usr/bin/env fish

alias rm="trash"
alias cp="cp -i"

alias .. "cd .."
alias cd.. "cd .."

alias gti git

# if type -q nvim
    alias v="nvim"
    alias vz="NVIM_APPNAME=nvim-lazyvim nvim"
    alias vc="NVIM_APPNAME=nvim-nvchad nvim"
    alias va="NVIM_APPNAME=nvim-astronvim nvim"
    alias vi="NVIM_APPNAME=nvim-lunarvim nvim"
    alias vk="NVIM_APPNAME=nvim-kickstart nvim"
# end

if type -q eza
    alias ls="eza -alf --color=always --sort=size | grep -v /"
    alias ld="eza -lD"
    alias lf="eza -lf --color=always | grep -v /"
    alias lh="eza -dl .* --group-directories-first"
    alias ll="eza -al --group-directories-first --git --icons -l"
    alias lt="eza -al --sort=modified"
end

if type -q bat
    alias cat="bat -P --style=plain"
end

# alias yarn="corepack yarn"
# alias yarnpkg="corepack yarnpkg"
# alias dlx="corepack dlx"
# alias pnpm="corepack pnpm"
# alias pnpx="corepack pnpx"
# alias npm="corepack npm"
# alias npx="corepack npx"

if type -q pwgen
    alias pwgx='pwgen -cnysBv'
    alias pwgns='pwgen -cnsBv' # no symbols
    set -l pwgex \\\'\\\"\\\\
    alias pwgcu="pwgen -cnysBv -r $pwgex"
    set -l pwgex \\\'\\\"\\\\\\\|/:=
    alias pwgn="pwgen -cynsBv -r $pwgex"
    set -l pwgex \\\'\\\"\\\\\\\|\\\{\\\}\\\(\\\)\\\`./:=
    alias pwgm="pwgen -cynsBv -r $pwgex"
    # set -l pwgex=\\\'\\\"\\\\\\\|\\\{\\\}\\\(\\\)[]\\\`\\\./:\\\;\\\,\\\<\\\>\\\?\\\=~\\\^\\\+\\\-
    set -l pwgex \\\'\\\"\\\\\\\|\\\{\\\}\\\(\\\)\\\`./:=[]\\\;\\\,\\\<\\\>~=\\\^\\\+\\\-\\\?
    alias pwgqdc="pwgen -cynsBv -r $pwgex"
end
