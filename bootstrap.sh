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

link () {
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
    ln -s "$src" "$dst"
    success "linked $src to $dst"
  else  
    success "skipped $src"
  fi
}

link "$DOTFILES_ROOT/bin" "$HOME/.local/bin"
link "$DOTFILES_ROOT/bash/bashrc" "$HOME/.bashrc"
link "$DOTFILES_ROOT/bash/bash_profile" "$HOME/.bash_profile"
link "$DOTFILES_ROOT/git/gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_ROOT/regolith/Xresources" "$HOME/.config/regolith/Xresources"
link "$DOTFILES_ROOT/regolith/i3xrocks/conf.d/01_setup" "$HOME/.config/regolith/i3xrocks/conf.d/01_setup"
link "$DOTFILES_ROOT/regolith/i3xrocks/conf.d/80_rofication" "$HOME/.config/regolith/i3xrocks/conf.d/80_rofication"
link "$DOTFILES_ROOT/regolith/i3xrocks/conf.d/90_time" "$HOME/.config/regolith/i3xrocks/conf.d/90_time"
#link "$DOTFILES_ROOT/i3/config" "$HOME/.config/i3/config"
#link "$DOTFILES_ROOT/i3/compton.conf" "$HOME/.config/i3/compton.conf"
#link "$DOTFILES_ROOT/xorg/.xsession" "$HOME/.xsession"

echo ''
echo '  All installed!'
