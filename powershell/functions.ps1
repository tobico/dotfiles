Remove-Item -Force alias:gps -ErrorAction SilentlyContinue
Remove-Item -Force alias:gcm -ErrorAction SilentlyContinue

function gs { git status $args }
function gf() { git fetch $args }
function ga() { git add $args }
function gb() { git branch $args }
function gco() { git checkout $args }
function gcob() { git checkout -b $args }
function gps() { git push $args }
function gpsf() { git push -f $args }
function gpl() { git pull $args }
function gcm() { git commit -m "$args" }
function gclf() { git clean -f $args }
function gcmc() { git commit -m "chore: $args" }
function gcmd() { git commit -m "docs: $args" }
function gcmf() { git commit -m "feat: $args" }
function gcmx() { git commit -m "fix: $args" }
function gcml() { git commit -m "localize: $args" }
function gcmr() { git commit -m "refactor: $args" }
function gcms() { git commit -m "style: $args" }
function gcmt() { git commit -m "test: $args" }
function gacm() { git add -A; gcm $args }
function gacmc() { git add -A; gcmc $args }
function gacmd() { git add -A; gcmd $args }
function gacmf() { git add -A; gcmf $args }
function gacmx() { git add -A; gcmx $args }
function gacml() { git add -A; gcml $args }
function gacmr() { git add -A; gcmr $args }
function gacms() { git add -A; gcms $args }
function gacmt() { git add -A; gcmt $args }
function gwip() { git add -u; git commit -m "WIP" }
function gundo() { git reset HEAD~1 --mixed }
function gamend() { git commit -a --amend }
function ghc() { hub compare }
function ghcl($user, $repo) { mkdir -Force ~/src; git clone git@github.com:$user/$repo ~/src/$user/$repo }
