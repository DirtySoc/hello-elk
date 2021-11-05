# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "generic/rocky8"
  
  config.vm.provider "hyperv" do |hv, override|
    hv.cpus = 4
    hv.maxmemory = 8192
    hv.memory= 8192
    # access your Kibana dashboard at http://<vm-ip>:<5601>/app/kibana 
    override.vm.network "public_network", bridge: "Default Switch"
  end

  config.vm.provider "virtualbox" do |vb, override|
    vb.memory = 8192
    vb.cpus = 4
    # access your Kibana dashboard at http://localhost:<5601>/app/kibana
    override.vm.network "forwarded_port", guest: 5601, host: 5602, host_ip: "127.0.0.1"
  end

  config.vm.provision "file", source: "./setup", destination: "setup"

  config.vm.provision "shell", inline: <<-SHELL
    chmod +x setup/*
    
    ./setup/config-firewalld.sh
    ./setup/install-elasticsearch.sh
    ./setup/install-kibana.sh
    ./setup/install-metricbeat.sh

    echo "####################################################################"
    echo "Setup Complete! Access your Kibana instance at: "
    ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1
  SHELL
end
