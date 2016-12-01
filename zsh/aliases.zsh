alias be="bundle exec"
alias r="bundle exec rails"
if type hub > /dev/null; then
  alias g="hub"
else
  alias g="git"
fi
alias ls="ls -Ghp"
alias cdg="cd \`git rev-parse --show-toplevel\`"
alias -g yo="$@ && echo dawg"
