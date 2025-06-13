#!/usr/bin/env fish

# homebrew bison first
if test -x "$(brew --prefix bison)/bin/bison"
  fish_add_path "$(brew --prefix bison)/bin"
end


