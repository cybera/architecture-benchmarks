#! /bin/bash

cd

sudo locale-gen en_CA.UTF-8

sudo apt-get update

sudo apt-get install -y wget python-software-properties git debconf-utils

sudo apt-get install -y apt-cacher-ng

service apt-cacher-ng restart

echo -n ""
echo "ACNG PRIVATE IP:"
ip -a | grep 10.0
echo -n ""
echo -n ""

