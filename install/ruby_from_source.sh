if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

RUBY_URL=http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz

# ruby dependencies
apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

cd /usr/local/src
rm -rf ruby*
wget $RUBY_URL
tar zxvf ruby*.gz
rm ruby*.gz

cd /usr/local/src/ruby*
./configure --prefix=/usr/local
make
make install

rm -rf ruby*
