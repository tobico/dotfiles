alias mercy="kill -9 %1"
alias be="bundle exec"
alias r="bundle exec rails"
alias -g yo=' && echo dawg'
alias re="touch tmp/restart.txt"
alias hooray="echo \"Hooray! =D\""
alias superpush="git fetch && git rebase origin/master && git push"

[ -s "$HOME/local.zsh" ] && source "$HOME/local.zsh"

export EDITOR="subl -w"

source "$HOME/.dotfiles/scm_breeze/scm_breeze.sh"
source "$HOME/.dotfiles/pure.zsh"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:"
export CDPATH="$HOME/src:$CDPATH"

# RBENV
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
