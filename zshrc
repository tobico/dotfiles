source "$HOME/.dotfiles/aliases.zsh"

[ -s "$HOME/local.zsh" ] && source "$HOME/local.zsh"

export EDITOR=vim

source "$HOME/.dotfiles/scm_breeze/scm_breeze.sh"
source "$HOME/.dotfiles/pure.zsh"

path=(/usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin $HOME/.rbenv/bin /usr/local/share/npm/bin)
export NODE_PATH="/usr/local/lib/node"
export CDPATH="$HOME/src:$CDPATH"

set -o emacs

fpath=($HOME/.dotfiles/zsh-completions/src $fpath)

source $HOME/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# RBENV
export RBENV_ROOT=$HOME/.rbenv
eval "$(rbenv init -)"
