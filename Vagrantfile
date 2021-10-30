# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "generic/rocky8"
  config.vm.network "public_network", bridge: "Default Switch"

  config.vm.provider "hyperv" do |hv|
    hv.cpus = 4
    hv.maxmemory = 8192
    hv.memory= 8192
  end

  config.vm.provision "file", source: "./setup", destination: "setup"
  # config.vm.provision "file", source: "./config-firewalld.sh", destination: "config-firewalld.sh"
  # config.vm.provision "file", source: "./install-elasticsearch.sh", destination: "install-install-elasticsearch.sh"
  # config.vm.provision "file", source: "./install-kibana.sh", destination: "install-kibana.sh"
  # config.vm.provision "file", source: "./install-metricbeat.sh", destination: "install-metricbeat.sh"

  config.vm.provision "shell", inline: <<-SHELL
    chmod +x setup/*
    # chmod +x config-firewalld.sh
    # chmod +x install-elasticsearch.sh
    # chmod +x install-kibana.sh
    # chmod +x install-metricbeat.sh
    
    ./setup/config-firewalld.sh
    ./setup/install-elasticsearch.sh
    ./setup/install-kibana.sh
    ./setup/install-metricbeat.sh

    IP_ADDR=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
    echo "####################################################################"
    echo "Setup Complete! Access your Kibana instance at http://$IP_ADDR:5601"
  SHELL
end
