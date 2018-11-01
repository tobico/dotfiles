
function chrome-debug() {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --no-first-run --no-default-browser-check --user-data-dir=$(mktemp -d -t 'chrome-remote_data_dir')
}
function docker-clean() {
  docker rm $(docker ps -a -q)
}

gs() { git status $@ }
gf() { git fetch $@ }
ga() { git add $@ }
gb() { git branch $@ }
gco() { git checkout $@ }
gcob() { git checkout -b $@ }
gps() { git push $@ }
gpsf() { git push -f $@ }
gpl() { git pull $@ }
gcm() { git commit -m "$*" }
gclf() { git clean -f $@ }
gcmc() { git commit -m "chore: $*" }
gcmd() { git commit -m "docs: $*" }
gcmf() { git commit -m "feat: $*" }
gcmx() { git commit -m "fix: $*" }
gcml() { git commit -m "localize: $*" }
gcmr() { git commit -m "refactor: $*" }
gcms() { git commit -m "style: $*" }
gcmt() { git commit -m "test: $*" }
gacm() { git add -A && gcm $@ }
gacmc() { git add -A && gcmc $@ }
gacmd() { git add -A && gcmd $@ }
gacmf() { git add -A && gcmf $@ }
gacmx() { git add -A && gcmx $@ }
gacml() { git add -A && gcml $@ }
gacmr() { git add -A && gcmr $@ }
gacms() { git add -A && gcms $@ }
gacmt() { git add -A && gcmt $@ }

gwip() { git add -u && git commit -m "WIP" }
gundo() { git reset HEAD~1 --mixed }
gamend() { git add -A && git commit --amend }
gbclean() { git branch --merged ${1-master} | grep -v " ${1-master}$" | xargs -r git branch -d }

ghc() { hub compare }
ghcl() { mkdir -p ~/src && git clone git@github.com:$1/$2 ~/src/$1/$2 }
