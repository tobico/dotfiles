DOTFILES="$HOME/.dotfiles"

source "$DOTFILES/aliases.zsh"
source "$DOTFILES/functions.zsh"

[ -s "$HOME/local.zsh" ] && source "$HOME/local.zsh"

export EDITOR=vim

if [ -e "$DOTFILES/scm_breeze/scm_breeze.sh" ]; then
  source "$DOTFILES/scm_breeze/scm_breeze.sh"
else
  echo "Note: .dotfiles submodules may not be not checked out"
fi
source "$DOTFILES/pure.zsh"

path=(/usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin $HOME/.rbenv/bin /usr/local/share/npm/bin $HOME/.dotfiles/bin)
export NODE_PATH="/usr/local/lib/node"
export CDPATH="$HOME/src:$CDPATH"

set -o emacs

fpath=($DOTFILES/zsh-completions/src $fpath)

if [ -e "$DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source $DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# RBENV
if [ -d "$HOME/.rbenv" ]; then
  export RBENV_ROOT=$HOME/.rbenv
  eval "$(rbenv init -)"
fi

path=(./bin $path)
