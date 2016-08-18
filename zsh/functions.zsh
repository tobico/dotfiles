ghcl () { mkdir -p ~/src && git clone git@github.com:$1/$2 ~/src/$1/$2 }

function chrome-debug() {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --no-first-run --no-default-browser-check --user-data-dir=$(mktemp -d -t 'chrome-remote_data_dir')
}
function docker-clean() {
  docker rm $(docker ps -a -q)
}
