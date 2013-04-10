for file in zshrc gitconfig
do
  rm -f $HOME/.$file
  ln -s $HOME/.dotfiles/$file $HOME/.$file
done

for file in preferences/*
do
  name=`basename $file`
  rm -f $HOME/Library/Preferences/$name
  ln -s $HOME/.dotfiles/$file $HOME/Library/Preferences/$name
done
