source "$HOME/.dotfiles/aliases.zsh"

[ -s "$HOME/local.zsh" ] && source "$HOME/local.zsh"

export EDITOR="subl -w"

source "$HOME/.dotfiles/scm_breeze/scm_breeze.sh"
source "$HOME/.dotfiles/pure.zsh"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/share/npm/bin"
export NODE_PATH="/usr/local/lib/node"
export CDPATH="$HOME/src:$CDPATH"

fpath=($HOME/.dotfiles/zsh-completions/src $fpath)

source $HOME/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# RBENV
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
