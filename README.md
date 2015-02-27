# Architecture Examples

Please note the enclosed Vagrantfiles uses the [vagrant-openstack-plugin](https://github.com/cloudbau/vagrant-openstack-plugin). Be sure to source your own rc file, adjust the floating IPs used in the Vagrantfile, and set the ACNG private IP for the servers accordingly. Lastly a security group allowing access to 3142 (apt-cacher) and 80 (http) to local instances (10.0.0.0/8 in our example) will be required as well.

The components as set up now use the Private IPs for testing - the floating IPs are only used for Vagrant to acces the instance, copy the bootstrap components, and then run them.

## 00-TestingServer

This shows how we set up our testing server

## 00-acng

An extra server for making installs faster. This is not necessary but recommended.

## 01-OneBigServer

One Big Server with everything installed

## 02-SplitServer

Move the database to it's own server

## 03-Standard

The rule of thumb of a load balancer in front of app servers with a separate database server

## 04-Cache

Turn on caching on the load balancer

----

nova secgroup-create benchmark-test benchmarks
nova secgroup-add-rule benchmark-test tcp 80 80 0.0.0.0/0
nova secgroup-add-rule benchmark-test tcp 22 22 0.0.0.0/0
nova secgroup-add-rule benchmark-test tcp 3306 3306 10.0.0.0/8
nova secgroup-add-rule benchmark-test tcp 3142 3142 10.0.0.0/8

----

Results:

01-OneBigServer: 9.56 & 9.53 transactions/sec
02-SplitServer: 4.50 & 4.08 transactions/sec 
03-Standard: 4.08 & 4.00 transactions/sec
04-Cache: 1401 & 1111 transactions/sec  

