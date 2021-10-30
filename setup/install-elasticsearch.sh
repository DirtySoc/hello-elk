#!/bin/bash
# Downloading, installing, and configuring Elasticsearch
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.1-x86_64.rpm
rpm -i elasticsearch-7.15.1-x86_64.rpm
# Disable nagging security warnings [NOT SECURE]
echo 'xpack.security.enabled: false' >> /etc/elasticsearch/elasticsearch.yml
service elasticsearch start