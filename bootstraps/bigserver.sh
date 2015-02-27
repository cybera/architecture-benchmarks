#! /bin/bash

cd

export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysqlpassw0rdz'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysqlpassw0rdz'
sudo apt-get -y install mysql-server apache2 php5-fpm libapache2-mod-php5 php5-mysql

wget -q  https://wordpress.org/latest.tar.gz

tar xzf latest.tar.gz -C /var/www/html/

# Load preloaded database
mysql -uroot -pmysqlpassw0rdz < /vagrant/initialSQL.sql
cp /vagrant/wp-config.php /var/www/html/wordpress/wp-config.php

