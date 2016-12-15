!#/bin/bash

sudo cp elasticsearch.repo /etc/yum.repos.d/
sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
sudo yum update -y && yum install -y elasticsearch java-1.8.0-openjdk.x86_64 httpd && yum clean all



