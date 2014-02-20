if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

ELASTICSEARCH_URL=https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.0.deb

# java for elasticsearch
apt-get -y install openjdk-7-jre

# elasticsearch from deb
wget $ELASTICSEARCH_URL -O /tmp/elasticsearch.deb
dpkg -i /tmp/elasticsearch.deb
rm /tmp/elasticsearch.deb

# elasticsearch head
/usr/share/elasticsearch/bin/plugin -i mobz/elasticsearch-head

# clean up
apt-get clean
