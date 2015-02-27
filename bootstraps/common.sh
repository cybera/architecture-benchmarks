#! /bin/bash

echo 'Running the Common bootstrap script'

#Change this or delete
export APT_PROXY="10.0.59.3"
export APT_PROXY_PORT=3142
if [[ ! -z "$APT_PROXY" ]]
then
        echo 'Acquire::http { Proxy "http://'${APT_PROXY}:${APT_PROXY_PORT}'"; };' | sudo tee /etc/apt/apt.conf.d/01apt-cacher-ng-proxy
fi

sudo locale-gen en_CA.UTF-8

sudo apt-get update

sudo apt-get install -y wget python-software-properties git debconf-utils
