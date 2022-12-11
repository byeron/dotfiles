#!/bin/bash

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# ghq
alias gcd='ghq look `ghq list |fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*"`'

# Docker
# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Select a docker container to remove
function drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}

# Select a docker image or images to remove
function drmi() {
  docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}

# v - open files in ~/.viminfo
# v() {
#   local files
#   files=$(grep '^>' ~/.viminfo | cut -c3- |
#           while read line; do
#             [ -f "${line/\~/$HOME}" ] && echo "$line"
#           done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
# }

# Integration with z
# alias j=z
# alias jj=zz
# unalias z
# z() {
#   if [[ -z "$*" ]]; then
#     cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
#   else
#     _last_z_args="$@"
#     _z "$@"
#   fi
# }
# 
# zz() {
#   cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
# }
