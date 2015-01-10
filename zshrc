DOTFILES="$HOME/.dotfiles"

# Prepare autocompletions
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# History
#
# http://www.lowlevelmanager.com/2012/04/zsh-history-extend-and-persist.html
HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
setopt APPEND_HISTORY          # append rather than overwrite history file.
HISTSIZE=1200                  # lines of history to maintain memory
SAVEHIST=1000                  # lines of history to maintain in history file.
setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt EXTENDED_HISTORY        # save timestamp and runtime information

. "$DOTFILES/aliases.zsh"
. "$DOTFILES/functions.zsh"

[ -s "$HOME/local.zsh" ] && . "$HOME/local.zsh"

export EDITOR=vim

. "$DOTFILES/pure.zsh"

path=(/usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin $HOME/.rbenv/bin /usr/local/share/npm/bin $HOME/.dotfiles/bin)
export NODE_PATH="/usr/local/lib/node"

# Removes default binding of ^Y to suspend on OS X
stty dsusp undef

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
