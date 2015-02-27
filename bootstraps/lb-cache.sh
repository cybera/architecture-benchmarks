#! /bin/bash

echo 'Running the LB with cache (nginx) in front bootstrap script'

sudo add-apt-repository -y ppa:nginx/stable

sudo apt-get update

sudo apt-get install -y nginx

cp /vagrant/default.nginx.conf /etc/nginx/sites-enabled/default

echo "Edit /etc/nginx/sites-enabled/default with the IPs for the web servers"
