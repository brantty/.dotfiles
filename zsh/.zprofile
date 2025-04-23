


# export CARGO_HOME="$HOME"/.cargo
# . "$CARGO_HOME/env"
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Hombebrew environment setup
eval $(/opt/homebrew/bin/brew shellenv)

[[ -d $(brew --prefix gnu-getopt)/bin ]] && PATH=$(brew --prefix gnu-getopt)/bin:$PATH

[[ -f $(brew --prefix asdf)/libexec/asdf.sh ]] && . $(brew --prefix asdf)/libexec/asdf.sh
