#!/usr/bin/env zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

local ZI_REPO='zdharma-continuum'
local GH_RAW_URL='https://raw.githubusercontent.com'
local ZUSER_REPO='zsh-users'

#===============PROMPT================
zi light-mode for \
    compile"(pure|async).zsh" \
    multisrc"(pure|async).zsh" \
    atinit"
      PURE_GIT_DOWN_ARROW='↓'; PURE_GIT_UP_ARROW='↑'
      PURE_PROMPT_SYMBOL='ᐳ'; PURE_PROME_VICMD_SYMBOL='<'
      zstyle ':prompt:pure:git:action' color 'yellow'
      zstyle ':prompt:pure:git:branch' color 'blue'
      zstyle ':prompt:pure:git:dirty' color 'red'
      zstyle ':prompt:pure:path' color 'cyan'
      zstyle ':prompt:pure:prompt:success' color 'green'" \
  sindresorhus/pure

#===========ANNEXS==================
zinit light-mode wait lucid for \
  $ZI_REPO/zinit-annex-{'bin-gem-node','binary-symlink','patch-dl','submods','readurl','rust'}


# Plugin history-search-multi-word loaded with investigating.
zinit light-mode wait lucid for \
    atinit"
      ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
      bindkey '^E' autosuggest-execute
      bindkey '^e' autosuggest-accept" \
    atload"_zsh_autosuggest_start" \
  $ZUSER_REPO/zsh-autosuggestions \
    atinit"
      typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100;
      zicompinit; zicdreplay" \
  $ZI_REPO/fast-syntax-highlighting \
  $ZI_REPO/history-search-multi-word
  #   blockf \
  #   atpull"zinit creinstall -q ." \
  # $ZUSER_REPO/zsh-completions

#=====================Final======================
zi for \
    atload'
      zicompinit; zicdreplay
      _zsh_highlight_bind_widgets
      _zsh_autosuggest_bind_widgets' \
    as'null' \
    id-as'zinit/cleanup' \
    lucid nocd wait \
  $ZI_REPO/null
