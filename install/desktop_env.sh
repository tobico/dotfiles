if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# command line stuff
apt-get -y install zsh vim tmux wget tig ncdu curl

# xwindows
apt-get -y install xserver-xorg lxdm i3

# clean up
apt-get clean
