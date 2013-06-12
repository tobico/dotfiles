for file in zshrc gitconfig
do
  rm -f $HOME/.$file
  ln -s $HOME/.dotfiles/$file $HOME/.$file
done

rm -rf $HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages
ln -s $HOME/.dotfiles/sublime_packages $HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages
