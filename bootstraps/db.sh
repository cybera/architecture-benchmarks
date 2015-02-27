#! /bin/bash

echo 'Running the DB bootstrap script'

sudo apt-get update

export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysqlpassw0rdz'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysqlpassw0rdz'
sudo apt-get -y install mysql-server 

mysql -uroot -pmysqlpassw0rdz < /vagrant/initialSQL.sql

mysql -uroot -pmysqlpassw0rdz -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'mysqlpassw0rdz';"
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
sudo service mysql restart

echo "Set `ip a | grep 'inet 10'` for db.cybera.ca in /etc/hosts on web.cybera.ca"
