#!/usr/bin/env zsh

# sheldon
# eval "$(sheldon source)"

# autojump
# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# asdf
#. /opt/homebrew/opt/asdf/libexec/asdf.sh

# fzf
#source <(fzf --zsh)

# zoxide
 type zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# Go
[[ -f $HOME/.asdf/plugins/golang/set-env.zsh ]] && . ~/.asdf/plugins/golang/set-env.zsh
