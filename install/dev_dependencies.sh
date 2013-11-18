if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# ruby dependencies
apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

# rails dependencies
apt-get -y install nodejs

# nokogiri dependencies
apt-get -y install libxslt-dev libxml2-dev

# mysql2 gem dependency
apt-get -y install libmysqlclient-dev

# phantomjs for testing
apt-get -y install phantomjs

# java for elasticsearch
apt-get -y install openjdk-7-jre

# clean up
apt-get clean
