#!/usr/bin/env fish

if not set -q XDG_CONFIG_HOME
    or not test -d "$XDG_CONFIG_HOME"
    mkdir -p "$HOME/.config"
    set -gx XDG_CONFIG_HOME "$HOME/.config"
end

if not set -q XDG_DATA_HOME
    or not test -d "$XDG_DATA_HOME"
    mkdir -p "$HOME/.local/share"
    set -gx XDG_DATA_HOME "$HOME/.local/share"
end

if not set -q XDG_CACHE_HOME
    or not test -d "$XDG_CACHE_HOME"
    mkdir -p "$HOME/.local/cache"
    set -gx XDG_CACHE_HOME "$HOME/.local/cache"
end

if not set -q CARGO_HOME
    or not test -d "$CARGO_HOME"
    mkdir -p "$XDG_DATA_HOME/cargo"
    set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
end

if not set -q RUSTUP_HOME
    or not test -d "$RUSTUP_HOME"
    mkdir -p "$XDG_DATA_HOME/rustup"
    set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
end

if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end

if type -q bat and not test -f "$BAT_CONFIG_PATH"
    # bat installed
    set -gx BAT_CONFIG_PATH "$XDG_CONFIG_HOME/bat/bat.conf"
end

type -q brew && eval (brew shellenv)

set -gx HOMEBREW_FORCE_BREWED_CURL 1

# source (brew --prefix asdf)/libexec/asdf.fish

if test -d "/Applications/Araxis Merge.app/Contents/Utilities"
    fish_add_path "/Applications/Araxis Merge.app/Contents/Utilities"
end

if test -d "/Applications/IntelliJ IDEA.app/Contents/MacOS"
    fish_add_path "/Applications/IntelliJ IDEA.app/Contents/MacOS"
end

for bindir in (brew --prefix gnu-getopt)/bin
    test -d $bindir && fish_add_path $bindir
end

if type -q nvim
    set -x MANPAGER 'nvim +Man!'
end

set -gx WEZTERM_THEME nord
