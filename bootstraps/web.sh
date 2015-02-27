#! /bin/bash

echo 'Running the web bootstrap script'

sudo apt-get update

sudo apt-get -y install apache2 php5-fpm libapache2-mod-php5 php5-mysql mysql-client

wget -q  https://wordpress.org/latest.tar.gz

tar xzf latest.tar.gz -C /var/www/html/

cp /vagrant/wp-config.php /var/www/html/wordpress/wp-config.php

echo "Don't forget to set the IP for db.cybera.ca in /etc/hosts"
