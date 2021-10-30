#!/bin/bash
# Updating firewalld to allow incoming connections from hyperv host
firewall-cmd --zone=public --add-source=172.26.96.1
firewall-cmd --zone=public --add-port=9200/tcp
firewall-cmd --zone=public --add-port=5601/tcp
firewall-cmd --runtime-to-permanent