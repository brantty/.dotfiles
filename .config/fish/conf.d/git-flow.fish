#!/usr/bin/env fish

if type -q git
  and type -q git-flow
  # git flow feature [...]
  alias gfls="git flow feature list"
  alias gfstart="git flow feature start --showcommand"
  alias gffinish="git flow feature finish --showcommand --nokeep --push"
  alias gffrb="git flow feature finish --showcommand --rebase --nokeep --push"
  alias gffpub="git flow feature publish --showcommand"
  alias gftrack="git flow feature track --showcommand"
  alias gfdiff="git flow feature diff --showcommand"
  alias gfco="git flow feature checkout --showcommand"
  alias gfrebase="git flow feature rebase --showcommand"
  alias gfdel="git flow feature delete --showcommand"
  alias gfmv="git flow feature rename --showcommand"

  # git flow release [...]
  alias grls="git flow release list"
  alias grstart="git flow release start --showcommand"
  alias grfinish="git flow release finish --showcommand --nokeep --push --ff-master"
  alias grbr="git flow release branch --showcommand"
  alias grpub="git flow release publish --showcommand"
  alias grtrack="git flow release track --showcommand"
  alias grrebase="git flow release rebase --showcommand"
  alias grdel="git flow release delete --showcommand"

  # git flow hotfix [...]
  alias ghls="git flow hotfix list"
  alias ghstart="git flow hotfix start --showcommand"
  alias ghfinish="git flow hotfix finish --showcommand --nokeep --push"
  alias ghpub="git flow hotfix publish --showcommand"
  alias ghtrack="git flow hotfix track --showcommand"
  alias ghrebase="git flow hotfix rebase --showcommand"
  alias ghdel="git flow hotfix delete --showcommand"

  alias glog="git flow log"
  alias gver="git flow version"
  alias gcfg="git config"
  alias gcset="git config set"
  alias gcbase="git config base"
else
  echo "git or git-flow not installed"
end

# function gftrack -d "git flow feature track --showcommands"
#   if type -q git
#     and type -q git-flow
#     command "git flow feature track $argv --showcommands"
#   else
#     echo "git or git-flow not installed"
#   end
# end

# function gffrb -d "git flow feature finish --nokeep --push --rebase --showcommands"
#   if type -q git
#     and type -q git-flow
#     command "git flow feature finish $argv --nokeep --push --rebase --showcommands"
#   else
#     echo "git or git-flow not installed"
#   end
# end
