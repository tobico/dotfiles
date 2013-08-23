for file in zshrc gitconfig tmux.conf
do
  rm -fv $HOME/.$file
  ln -sv $HOME/.dotfiles/$file $HOME/.$file
done

rm -fv $HOME/Library/Keybindings/DefaultKeyBinding.dict
mkdir -pv $HOME/Library/Keybindings
ln -sv $HOME/.dotfiles/key_bindings $HOME/Library/Keybindings/DefaultKeyBinding.dict
