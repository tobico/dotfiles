DOTFILES="$HOME/.dotfiles"

# Prepare autocompletions
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

. "$DOTFILES/aliases.zsh"
. "$DOTFILES/functions.zsh"

export EDITOR=vim

. "$DOTFILES/pure.zsh"

path=(/usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin $HOME/.rbenv/bin /usr/local/share/npm/bin $HOME/.dotfiles/bin)
export NODE_PATH="/usr/local/lib/node"

set -o emacs

fpath=($DOTFILES/zsh-completions/src $fpath)

if [ -e "$DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  . $DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -e "$DOTFILES/scm_breeze/scm_breeze.sh" ]; then
  . "$DOTFILES/scm_breeze/scm_breeze.sh"
else
  echo "Note: .dotfiles submodules may not be not checked out"
fi

# RBENV
if [ -d "$HOME/.rbenv" ]; then
  export RBENV_ROOT=$HOME/.rbenv
  eval "$(rbenv init -)"
fi

path=(./bin $path)

[ -s "$HOME/local.zsh" ] && . "$HOME/local.zsh"
