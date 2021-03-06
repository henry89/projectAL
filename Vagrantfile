# -*- mode: ruby -*-
# vi: set ft=ruby :

#yaml module required for importing the settings stored in servers.yml
require "yaml"

servers = YAML.load_file("./servers/servers.yml")


Vagrant.configure("2") do |config|
  
  # config.vagrant.plugins = ["vagrant-vbguest", "vagrant-omnibus", "vagrant-berkself"] 
  
  # force update
  config.vbguest.auto_update = true

  config.omnibus.chef_version = :latest

  ### Web servers ###
  servers["webservers"].each do |host|
    config.vm.box = "hashicorp/bionic64"
    config.vm.define host['name'] do |define|
      define.vm.hostname = host['name']
      define.vm.provider "virtualbox" do |vb|
        vb.name = host['name']
      end
      define.vm.network "private_network", ip: host['ip']
      define.ssh.forward_agent = true
      define.vm.provision "chef_solo" do |chef|
        chef.arguments = "--chef-license accept"
        chef.provisioning_path = "/var/chef"
        chef.cookbooks_path = ["chef/cookbooks"]
        chef.roles_path = "chef/roles"
        chef.add_role  ('webserver')
      end
    end
  end
 ### Web servers end ###

  ### Load balancer  ###
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
        chef.arguments = "--chef-license accept"
        chef.provisioning_path = "/var/chef"
        chef.cookbooks_path = ["chef/cookbooks"]
        chef.roles_path = "chef/roles"
        chef.add_role  ('loadbalancer')
      end
    end
  end
  ### Load balancer - end ### 

end
