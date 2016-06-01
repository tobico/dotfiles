export DOTFILES="$HOME/.dotfiles"
export EDITOR=vim
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rbenv/bin:/usr/local/share/npm/bin:$HOME/.dotfiles/bin:$HOME/bin:./node_modules/.bin:./bin
export NODE_PATH="/usr/local/lib/node"

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

[ -s "$HOME/local.sh" ] && . "$HOME/local.sh"
