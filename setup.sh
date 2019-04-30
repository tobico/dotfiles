#!/bin/zsh

set -e

DOTFILES=`pwd`

echo "Replacing dotfiles with symlinks"
for file in tmux.conf vimrc vim fonts gitignore pam_environment
do
  rm -rf $HOME/.$file
  ln -sv $DOTFILES/$file $HOME/.$file
done

if [ ! -f "$HOME/.zshrc" ]; then
  echo "Writing zshrc"
  echo "export DOTFILES=\"$DOTFILES\"" > $HOME/.zshrc
  echo ". $DOTFILES/common.sh" >> $HOME/.zshrc
  echo ". $DOTFILES/zsh.zsh" >> $HOME/.zshrc
fi

ZSH_DEFAULT=""
finger $LOGNAME | grep "/bin/zsh" > /dev/null && ZSH_DEFAULT=yes

if [ -z "$ZSH_DEFAULT" ]; then
  echo "Changing default shell to zsh, please provide password"
  chsh -s /bin/zsh
fi

cp -f $DOTFILES/gitconfig $HOME/.gitconfig

