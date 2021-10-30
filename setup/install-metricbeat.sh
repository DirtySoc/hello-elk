#!/bin/bash
# Install metricbeat
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.15.1-x86_64.rpm
rpm -vi metricbeat-7.15.1-x86_64.rpm
metricbeat modules enable system
metricbeat setup -e
service metricbeat enable
service metricbeat start