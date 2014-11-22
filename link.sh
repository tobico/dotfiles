#!/usr/bin/env zsh

DOTFILES="$HOME/.dotfiles"

echo "Changing shell to zsh"
sudo chsh -s `which zsh` $USER

echo "Replacing dotfiles with symlinks"
for file in zshrc gitconfig tmux.conf vimrc vim git.scmbrc fonts Xresources gtkrc-2.0 i3 gitignore themes
do
  rm -rf $HOME/.$file
  ln -sv $DOTFILES/$file $HOME/.$file
done
mkdir -pv $HOME/.config/ranger
rm -f $HOME/.config/ranger/rc.conf
ln -sv $DOTFILES/config/ranger/rc.conf $HOME/.config/ranger/rc.conf

if [ -d "$HOME/Library" ]; then
  echo "Linking services directory"
  rm -f $HOME/Library/Services
  ln -s $DOTFILES/mac/services $HOME/Library/Services

  echo "Enabling Ctrl+W on OSX"
  rm -fv $HOME/Library/Keybindings/DefaultKeyBinding.dict
  mkdir -pv $HOME/Library/Keybindings
  ln -sv $DOTFILES/mac/key_bindings $HOME/Library/Keybindings/DefaultKeyBinding.dict
fi
