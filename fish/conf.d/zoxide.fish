#!/usr/bin/env fish

if type -q zoxide
    zoxide init fish | source
else
    echo "zoxide: not found, install from https://github.com/ajeetdsouza/zoxide"
end
