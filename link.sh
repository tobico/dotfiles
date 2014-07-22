#!/usr/bin/env zsh

echo "Changing shell to zsh"
sudo chsh -s `which zsh` $USER

echo "Replacing dotfiles with symlinks"
for file in zshrc gitconfig tmux.conf vimrc vim git.scmbrc fonts Xresources gtkrc-2.0 i3 gitignore themes
do
  rm -rf $HOME/.$file
  ln -sv $HOME/.dotfiles/$file $HOME/.$file
done
#rm -rf $HOME/.config/sublime-text-3/Packages/User
#ln -sv $HOME/.dotfiles/sublime $HOME/.config/sublime-text-3/Packages/User
mkdir -pv $HOME/.config/ranger
rm -f $HOME/.config/ranger/rc.conf
ln -sv $HOME/.dotfiles/config/ranger/rc.conf $HOME/.config/ranger/rc.conf

# Install gnome-terminal configuraton
gconftool-2 --shutdown
mkdir -p $HOME/.gconf/apps
rm -rf $HOME/.gconf/apps/gnome-terminal
ln -sv $HOME/.dotfiles/gnome-terminal $HOME/.gconf/apps/gnome-terminal
gconftool-2 --spawn

if [ -d "$HOME/Library" ]; then
  echo "Enabling Ctrl+W on OSX"
  rm -f $HOME/Library/Services
  ln -s $HOME/.dotfiles/services $HOME/Library/Services

  rm -fv $HOME/Library/Keybindings/DefaultKeyBinding.dict
  mkdir -pv $HOME/Library/Keybindings
  ln -sv $HOME/.dotfiles/key_bindings $HOME/Library/Keybindings/DefaultKeyBinding.dict
fi

# Enable .gitignore
git config --global core.excludesfile ~/.gitignore

# Update Xresources so that new terminal settings apply right away
if (( $+commands[xrdb] )); then
  xrdb $HOME/.Xresources
fi
