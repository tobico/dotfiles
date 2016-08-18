. "$DOTFILES/zsh/aliases.zsh"
. "$DOTFILES/zsh/functions.zsh"
. "$DOTFILES/zsh/pure.zsh"

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

# Removes default binding of ^Y to suspend on OS X
stty dsusp undef

set -o emacs

fpath=($DOTFILES/zsh-completions/src $fpath)

if [ -e "$DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  . $DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
