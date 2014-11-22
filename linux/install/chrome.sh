if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

CHROME_URL=https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb

if dpkg -s google-chrome-stable; then
  echo Chrome already installed, skipping
else
  apt-get install -y libxss1

  wget $CHROME_URL -O /tmp/chrome.deb
  dpkg -i /tmp/chrome.deb
  rm /tmp/chrome.deb
fi
