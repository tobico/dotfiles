if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# essential tools
apt-get -y install zsh vim tmux ack-grep wget curl

# text UI file management
apt-get -y install ncdu ranger tig

# handy stuff
apt-get -y install qalc dstat iftop cloc

# clean up
apt-get clean
