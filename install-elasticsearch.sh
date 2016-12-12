!#/bin/bash

sudo cp elasticsearch.repo /etc/yum.repos.d/
sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
sudo yum update -y && yum install -y elasticsearch java-1.8.0-openjdk.x86_64 httpd && yum clean all


## Install php5.4
sudo yum install -y php
cd /tmp && wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -Uvh epel-release-latest-7.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm

## upgrade php5.4 to php5.6
sudo remi.repo /etc/yum.repos.d/remi.repo
sudo yum upgrade -y php*
sudo yum install -y php-gd php-pgsql php-mbstring php-xml php-pecl-json 


