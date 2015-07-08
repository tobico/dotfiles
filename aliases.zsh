alias be="bundle exec"
alias r="bundle exec rails"
alias superpush="git fetch && git rebase origin/master && git push"
alias hbs="hub browse"
alias gdmb="git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d"
alias ls="ls -h"
alias -g yo="$@ && echo dawg"

function dockerclean() {
  docker rm $(docker ps -a -q)
}
