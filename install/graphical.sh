if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# xwindows
apt-get -y install xserver-xorg lxdm i3

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb -O /tmp/chrome.deb
dpkg -i /tmp/chrome.deb
rm /tmp/chrome.deb

# clean up
apt-get clean
