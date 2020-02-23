# -*- mode: ruby -*-
# vi: set ft=ruby :

#yaml module required for importing the settings stored in servers.yml
require "yaml"

servers = YAML.load_file("./servers/servers.yml")

Vagrant.configure("2") do |config|

  ### web servers ###
  servers["webservers"].each do |host|
    config.vm.box = "ubuntu/bionic64"
    config.vm.define host['name'] do |define|
      define.vm.hostname = host['name']
      define.vm.provider "virtualbox" do |vb|
        vb.name = host['name']
      end
      define.vm.network "private_network", ip: host['ip']
      define.ssh.forward_agent = true
      define.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["./chef/cookNginx","./chef/cookDefault", "./chef/cookWeb"]
        chef.roles_path = "./chef/roles"
        chef.add_role = 'webserver'
      end
    end
  end
 ### web servers end ###

  ### load balancer  ###
  servers["loadbalancer"].each do |host|
    config.vm.define host['name'] do |define|
      config.vm.box = "hashicorp/bionic64"
      define.vm.hostname = host['name']
      define.vm.provider "virtualbox" do |vb|
        vb.name = host['name']
      end
      define.vm.network "private_network", ip: host['ip']
      define.ssh.forward_agent = true
      define.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["./chef/cookNginx","./chef/cookDefault"]
        chef.roles_path = "./chef/roles"
        chef.add_role = 'loadbalancer'
      end
    end
  end
  ### Load balancer - end ### 

end
