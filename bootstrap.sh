#!/usr/bin/env sh

set -e

git submodule update --init

DOTFILES="$HOME/.dotfiles"

echo "Replacing dotfiles with symlinks"
for file in profile bashrc zshrc tmux.conf vimrc vim git.scmbrc fonts gitignore
do
  rm -rf $HOME/.$file
  ln -sv $DOTFILES/$file $HOME/.$file
done

cp -f $DOTFILES/gitconfig $HOME/.gitconfig

if [ -d "$HOME/Library" ]; then
  echo "Linking services directory"
  rm -f $HOME/Library/Services
  ln -s $DOTFILES/mac/services $HOME/Library/Services

  echo "Enabling Ctrl+W on OSX"
  rm -fv $HOME/Library/Keybindings/DefaultKeyBinding.dict
  mkdir -pv $HOME/Library/Keybindings
  ln -sv $DOTFILES/mac/key_bindings $HOME/Library/Keybindings/DefaultKeyBinding.dict
fi
