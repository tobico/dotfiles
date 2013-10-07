for file in zshrc gitconfig tmux.conf vimrc vim git.scmbrc
do
  rm -fv $HOME/.$file
  ln -sv $HOME/.dotfiles/$file $HOME/.$file
done

rm -f $HOME/Library/Services
ln -s $HOME/.dotfiles/services $HOME/Library/Services

rm -fv $HOME/Library/Keybindings/DefaultKeyBinding.dict
mkdir -pv $HOME/Library/Keybindings
ln -sv $HOME/.dotfiles/key_bindings $HOME/Library/Keybindings/DefaultKeyBinding.dict
