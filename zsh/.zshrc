#!/usr/bin/env zsh

[[ -s "$ZDOTDIR/.preset.zsh" ]] && source "$ZDOTDIR/.preset.zsh"
# source your proxy shrc file if exists
[[ -s "$ZDOTDIR/.proxy.zsh" ]] && source "$ZDOTDIR/.proxy.zsh"

# source your own function file if exists
[[ -s "$ZDOTDIR/.fun.zsh" ]] && source "$ZDOTDIR/.fun.zsh"

# >>>> Vagrant command completion (start)
# fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/zsh $fpath)
# <<<<  Vagrant command completion (end)

# fpath=(
#     # /usr/share/zsh/site-functions
#     $ZDOTDIR/functions
#     "${fpath[@]}"
# )

## Zinit
[[ -f "$ZDOTDIR/.zinit.zsh" ]] && source "$ZDOTDIR/.zinit.zsh"

## zimfw
# [[ -s "$ZDOTDIR/.zim.zsh" ]] && source "$ZDOTDIR/.zim.zsh"


# source your own alias file if exists
[[ -s "$ZDOTDIR/.alias.zsh" ]] && source "$ZDOTDIR/.alias.zsh"

# ource your own shrc file if exists
[[ -s "$ZDOTDIR/.postset.zsh" ]] && source "$ZDOTDIR/.postset.zsh"
