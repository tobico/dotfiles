if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# xwindows
apt-get -y install xserver-xorg lxdm i3

# getting errors installing chrome and loading xresources when we don't do this
apt-get -y -f install

# pdf viewer
apt-get -y install evince

# chrome
if dpkg -s google-chrome-stable; then
  echo Chrome already installed, skipping
else
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb -O /tmp/chrome.deb
  dpkg -i /tmp/chrome.deb
  rm /tmp/chrome.deb
fi

# thunderbird
apt-get -y install thunderbird

# hipchat
if dpkg -s hipchat; then
  echo Hipchat already installed, skipping
else
  echo "deb http://downloads.hipchat.com/linux/apt stable main" > /etc/apt/sources.list.d/atlassian-hipchat.list
  wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
  apt-get update
  apt-get -y install hipchat
fi

# skype
if dpkg -s skype; then
  echo Skype already installed, skipping
else
  add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
  apt-get update
  apt-get -y install skype
fi

# printing support
apt-get -y install cups

# audio support
apt-get -y install alsa-base alsa-oss gnome-alsamixer
apt-get -y autoremove pulseaudio

# clean up
apt-get clean
