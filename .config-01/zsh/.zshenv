#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# export TERM="rxvt-256color"
# export DOTFILES="$HOME/.dotfiles"
# export WORKSPACE="$HOME/workspace"

# [[ -f "$DOTFILES/install_config" ]] && source "$DOTFILES/install_config"

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}
# export XDG_PROJECTS_DIR=${XDG_PROJECT_DIR:-$HOME/Projects}

# Fish-like dirs
: ${__zsh_config_dir:=${ZDOTDIR:-{XDG_CONFIG_HOME:-$HOME/.config}/zsh}}
: ${__zsh_user_data_dir:=${XDG_DATA_HOME:--$HOME/.local/share}/zsh}
: ${__zsh_cache_dir:=${XDG_CACHE_HOME:--$HOME/.cache}/zsh}

# Ensure Zsh directories exist.
() {
  local zdir
  for zdir in $@; do
  	[[ -d "${(P)zdir}" ]] || mkdir -p "${(P)zdir}"
  done
} __zsh_{config,user_data,cache}_dir XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_RUNTIME_DIR

# Make Terminal.app behave.
if [[ "$OSTYPE" == darwin* ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
setopt no_global_rcs
export HISTFILE="$ZDOTDIR/.zshistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maxium events in history file
export HISTORY_SUSSTRING_SEARCH_ENSURE_UNIQUE=1     # all search results returned will be unique
setopt incappendhistory                             # add command to history as soon as  it's entered
setopt extendedhistory                              # save command timestamp
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS                            # don't write duplicate entries in the history file
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE                            # prefix commnads you don't want stored with a space
export HISTORTY_IGNORE="(builtin *|exit|ls|r|open|pwd|q|x *|s *|cd *)"

setopt NO_HUP                                       # don't kill jobs
setopt NO_CHECK_JOBS
setopt correct                                      # spelling correction for commnads
setopt autocd
setopt interactivecomments
setopt extended_glob
unsetopt rm_star_silent                             # ask for confirmation for rm * or rm path/*

# typeset -gA FAST_HIGHLIGHT_STYLES
# FAST_HIGHLIGHT_STYLES[alias]="fg=blue"
# FAST_HIGHLIGHT_STYLES[path]="fg=blue"
# FAST_HIGHLIGHT_STYLES[path-to-dir]="fg=blue,underline"
# FAST_HIGHLIGHT_STYLES[suffix-alias]="fg=blue"
# FAST_HIGHLIGHT_STYLES[builtin]="fg=blue"
# FAST_HIGHLIGHT_STYLES[function]="fg=blue"
# FAST_HIGHLIGHT_STYLES[precommand]="fg=red,bg=default,underline,bold"
# FAST_HIGHLIGHT_STYLES[command]="fg=blue"
# # FAST_HIGHLIGHT_STYLES[commandseparator]="fg=16"
# FAST_HIGHLIGHT_STYLES[comment]="fg=0008,bold,italic"
# FAST_HIGHLIGHT_STYLES[single-quoted-argument]="fg=yellow"
# FAST_HIGHLIGHT_STYLES[double-quoted-argument]="fg=yellow"
# FAST_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=yellow"
# FAST_HIGHLIGHT_STYLES[single-hyphen-option]="fg=yellow"
# FAST_HIGHLIGHT_STYLES[double-hyphen-option]="fg=yellow"
# FAST_HIGHLIGHT_STYLES[variable]="fg=016"
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=012,fg=255,bold'
# zle_highlight=('paste:reverse')

# # ohter software
# export TMUXP_CONFIGDIR="$XDG_CONFIG_HOME/tmuxp"
# export COMPOSER_HOME="$XDG_CONFIG_HOME/composer"
# export I3_CONFIG="$XDG_CONFIG_HOME/i3"
# export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
# export GIMP_VERSION="2.10"
# export SCREENSHOT="$HOME/Documents/images/screenshots"

# # Man pages
# export MANPAGER='nvim +Man!'

# export PATH=~/.local/bin:$PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=/usr/local/sbin:$PATH
# export PATH=$HOME/.yarn/bin:$PATH

# export PATH=$PATH:/Applications/Araxis\ Merge.app/Contents/Utilities

# export ANDROID_HOME=~/Library/Android/sdk
# export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
