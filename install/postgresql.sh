if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# postgresql server
apt-get -y install postgresql

# postgresql gem dependency
apt-get -y install libpq-dev

# clean up
apt-get clean
