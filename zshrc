source "$HOME/.dotfiles/aliases.zsh"

[ -s "$HOME/local.zsh" ] && source "$HOME/local.zsh"

export EDITOR="subl -w"

source "$HOME/.dotfiles/scm_breeze/scm_breeze.sh"
source "$HOME/.dotfiles/pure.zsh"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:"
export CDPATH="$HOME/src:$CDPATH"

# RBENV
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
