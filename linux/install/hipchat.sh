if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

if dpkg -s hipchat; then
  echo Hipchat already installed, skipping
else
  echo "deb http://downloads.hipchat.com/linux/apt stable main" > /etc/apt/sources.list.d/atlassian-hipchat.list
  wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
  apt-get update
  apt-get -y install libpulse0 hipchat
fi
