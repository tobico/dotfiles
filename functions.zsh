ghcl () { mkdir -p ~/src && git clone git@github.com:$1/$2 ~/src/$1/$2 }

function dockerclean() {
  docker rm $(docker ps -a -q)
}
