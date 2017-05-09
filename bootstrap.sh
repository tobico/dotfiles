#!/usr/bin/env sh

set -e

# git submodule update --init

DOTFILES="$HOME/dotfiles"

echo "Replacing dotfiles with symlinks"
for file in tmux.conf vimrc vim fonts gitignore
do
  rm -rf $HOME/.$file
  ln -sv $DOTFILES/$file $HOME/.$file
done

if [ -f "$HOME/.profile" ]; then
  rm $HOME/.profile
fi

if [ ! -f "$HOME/.bashrc" ]; then
  echo ". $DOTFILES/common.sh" > $HOME/.bashrc
fi

if [ ! -f "$HOME/.zshrc" ]; then
  echo ". $DOTFILES/common.sh" > $HOME/.zshrc
  echo ". $DOTFILES/zsh.zsh" >> $HOME/.zshrc
fi

cp -f $DOTFILES/gitconfig $HOME/.gitconfig

# MacOS setup

if [ -d "$HOME/Library" ]; then
  echo "Linking services directory"
  rm -f $HOME/Library/Services
  ln -s $DOTFILES/mac/services $HOME/Library/Services

  echo "Enabling Ctrl+W on OSX"
  rm -fv $HOME/Library/Keybindings/DefaultKeyBinding.dict
  mkdir -pv $HOME/Library/Keybindings
  ln -sv $DOTFILES/mac/key_bindings $HOME/Library/Keybindings/DefaultKeyBinding.dict
fi

# Linux setup

if [ -d "$HOME/.config" ]; then
  echo "Linking config"
  mkdir -pv $HOME/.config/Code/User
  rm -f $HOME/.config/Code/User/settings.json
  ln -sv $DOTFILES/vscode-settings.json $HOME/.config/Code/User/settings.json
fi
