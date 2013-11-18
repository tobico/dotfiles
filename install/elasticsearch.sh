if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# java for elasticsearch
apt-get -y install openjdk-7-jre

# elasticsearch from deb
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb -O /tmp/elasticsearch.deb
dpkg -i /tmp/elasticsearch.deb
rm /tmp/elasticsearch.deb

# elasticsearch head
/usr/share/elasticsearch/bin/plugin -i mobz/elasticsearch-head

# clean up
apt-get clean
