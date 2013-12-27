echo "apt shell provisioning"

MYSQL_PASSWORD="testing"

echo "installing mysql"

echo "mysql-server-5.5 mysql-server/root_password password $MYSQL_PASSWORD" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password $MYSQL_PASSWORD" | debconf-set-selections
apt-get -y install mysql-client mysql-server-5.5

sleep 3

echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '';flush privileges;" | mysql -u root -ptesting

# no binding restriction for mysql daemon
cp /etc/mysql/my.cnf /etc/mysql/my.cnf.bu
sed 's/^bind-address/#bind-address/' /etc/mysql/my.cnf.bu > /etc/mysql/my.cnf

service mysql restart
