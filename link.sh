#!/usr/bin/zsh

echo "Changing shell to zsh"
chsh -s /usr/bin/zsh

echo "Replacing dotfiles with symlinks"
for file in zshrc gitconfig tmux.conf vimrc vim git.scmbrc fonts Xresources gtkrc-2.0
do
  rm -f $HOME/.$file
  ln -sv $HOME/.dotfiles/$file $HOME/.$file
done

if [ -d "$HOME/Library" ]; then
  echo "Enabling Ctrl+W on OSX"
  rm -f $HOME/Library/Services
  ln -s $HOME/.dotfiles/services $HOME/Library/Services

  rm -fv $HOME/Library/Keybindings/DefaultKeyBinding.dict
  mkdir -pv $HOME/Library/Keybindings
  ln -sv $HOME/.dotfiles/key_bindings $HOME/Library/Keybindings/DefaultKeyBinding.dict
fi

# Update Xresources so that new terminal settings apply right away
if (( $+commands[xrdb] )); then
  xrdb $HOME/.Xresources
fi
