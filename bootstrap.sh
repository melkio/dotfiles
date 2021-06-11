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

echo 'Linking dot files...'

link "$DOTFILES_ROOT/zsh/zshrc" "$HOME/.zshrc"
link "$DOTFILES_ROOT/zsh/p10k.zsh" "$HOME/.p10k.zsh"

link "$DOTFILES_ROOT/nvim/init.vim" "$HOME/.config/nvim/init.vim"

link "$DOTFILES_ROOT/bin" "$HOME/.local/bin"
link "$DOTFILES_ROOT/bash/bashrc" "$HOME/.bashrc"
link "$DOTFILES_ROOT/bash/bash_profile" "$HOME/.bash_profile"

link "$DOTFILES_ROOT/tmux/tmux.conf" "$HOME/.tmux.conf"

link "$DOTFILES_ROOT/git/gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_ROOT/git/alias" "$HOME/.local/source/git_alias"

link "$DOTFILES_ROOT/vscode/settings.json" "$HOME/.config/Code/User/settings.json"

link "$DOTFILES_ROOT/asdf/install" "$HOME/.local/source/asdf_install"
link "$DOTFILES_ROOT/asdf/alias" "$HOME/.local/source/asdf_alias"

link "$DOTFILES_ROOT/dotnet/alias" "$HOME/.local/source/dotnet_alias"

link "$DOTFILES_ROOT/docker/alias" "$HOME/.local/source/docker_alias"

link "$DOTFILES_ROOT/regolith/Xresources" "$HOME/.config/regolith/Xresources"
link "$DOTFILES_ROOT/regolith/i3xrocks/conf.d/01_setup" "$HOME/.config/regolith/i3xrocks/conf.d/01_setup"
link "$DOTFILES_ROOT/regolith/i3xrocks/conf.d/80_rofication" "$HOME/.config/regolith/i3xrocks/conf.d/80_rofication"
link "$DOTFILES_ROOT/regolith/i3xrocks/conf.d/90_time" "$HOME/.config/regolith/i3xrocks/conf.d/90_time"

link "$DOTFILES_ROOT/alacritty/themes/dracula.yml" "$HOME/.config/alacritty/themes/dracula.yml"
link "$DOTFILES_ROOT/alacritty/themes/gnome_dark.yml" "$HOME/.config/alacritty/themes/gnome_dark.yml"
link "$DOTFILES_ROOT/alacritty/themes/solarized_dark.yml" "$HOME/.config/alacritty/themes/solarized_dark.yml"
link "$DOTFILES_ROOT/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

link "$DOTFILES_ROOT/karabiner" "$HOME/.config/karabiner"

echo 'Configuring vscode...'
. "$DOTFILES_ROOT/vscode/configure.sh"

echo ''
echo '  All installed!'
