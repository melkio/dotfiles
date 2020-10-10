#!/usr/bin/env bash
#
# bootstrap installs things.

DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2
  local skip="false"

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    local currentSrc="$(readlink $dst)"

    if [ "$currentSrc" = "$src" ]
    then
      skip="true";
    else
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi
  fi

  if [ "$skip" != "true" ]
  then
    mkdir -p $(dirname "$dst")
    ln -s "$1" "$2"
    success "linked $1 to $2"
  else  
    success "skipped $src"
  fi
}

link_file "$DOTFILES_ROOT/bash/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_ROOT/git/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_ROOT/i3/config" "$HOME/.config/i3/config"
link_file "$DOTFILES_ROOT/i3/compton.conf" "$HOME/.config/i3/compton.conf"
link_file "$DOTFILES_ROOT/xorg/.xsession" "$HOME/.xsession"

echo ''
echo '  All installed!'
