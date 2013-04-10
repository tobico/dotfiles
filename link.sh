for file in zshrc gitconfig
do
  rm -f $HOME/.$file
  ln -s $HOME/.dotfiles/$file $HOME/.$file
done
