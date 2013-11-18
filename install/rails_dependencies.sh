if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# rails dependencies
apt-get -y install nodejs

# nokogiri dependencies
apt-get -y install libxslt-dev libxml2-dev

# phantomjs for testing
apt-get -y install phantomjs

# clean up
apt-get clean
