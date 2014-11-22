if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# mysql server
apt-get -y install mysql-server

# mysql2 gem dependency
apt-get -y install libmysqlclient-dev

# clean up
apt-get clean
