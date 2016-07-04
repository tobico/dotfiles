alias be="bundle exec"
alias r="bundle exec rails"
alias superpush="git fetch && git rebase origin/master && git push"
alias hbs="hub browse"
alias gdmb="git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d"
alias ls="ls -h"
alias -g yo="$@ && echo dawg"
alias chrome-debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --no-first-run --no-default-browser-check --user-data-dir=$(mktemp -d -t 'chrome-remote_data_dir')"

function dockerclean() {
  docker rm $(docker ps -a -q)
}
