#!/bin/bash
# Downloading, installing, and configuring Kibana

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

touch /etc/yum.repos.d/kibana.repo
tee << EOF > /etc/yum.repos.d/kibana.repo
[kibana-7.x]
name=Kibana repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

yum install kibana -y

# Kibana binds to all interfaces... [NOT SECURE]
echo 'server.host: "0.0.0.0"' >> /etc/kibana/kibana.yml

systemctl enable kibana.service
systemctl start kibana.service