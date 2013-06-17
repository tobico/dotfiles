for file in zshrc gitconfig
do
  rm -fv $HOME/.$file
  ln -sv $HOME/.dotfiles/$file $HOME/.$file
done

rm -rfv $HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages
ln -sv $HOME/.dotfiles/sublime_packages $HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages
rm -fv $HOME/Library/Keybindings/DefaultKeyBinding.dict
mkdir -pv $HOME/Library/Keybindings
ln -sv $HOME/.dotfiles/key_bindings $HOME/Library/Keybindings/DefaultKeyBinding.dict
