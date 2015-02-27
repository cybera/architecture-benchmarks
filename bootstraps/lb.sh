#! /bin/bash

echo 'Running the LB bootstrap script'

sudo add-apt-repository -y ppa:vbernat/haproxy-1.5

sudo apt-get update

sudo apt-get install -y haproxy

sudo cp /vagrant/haproxy.cfg /etc/haproxy/haproxy.cfg

echo "Edit /etc/haproxy/haproxy.cfg with the IPs for the web servers"
