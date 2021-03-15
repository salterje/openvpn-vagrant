# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.define "openvpn" do |openvpn|
    openvpn.vm.provider "virtualbox" do |v|
      v.name = "ubuntu-openvpn"
      v.memory = 2048
      v.cpus = 2
      v.customize ["modifyvm", :id, "--description", "This is a openvpn server"]
    end  
    openvpn.vm.hostname = "openvpn-1"
    openvpn.vm.network "private_network", ip: "192.168.200.10"
    openvpn.vm.network "private_network", ip: "172.16.0.10"
    openvpn.vm.provision "shell", path: "scripts/openvpn.sh"
  end 


  config.vm.define "client" do |client|
    client.vm.provider "virtualbox" do |v|
      v.name = "client-1"
      v.memory = 1024
      v.cpus = 1
      v.customize ["modifyvm", :id, "--description", "This is an ubuntu server"]
    end  
    client.vm.hostname = "client-1"
    client.vm.network "private_network", ip: "192.168.200.11"
    client.vm.provision "shell", path: "scripts/client.sh"
  end
 
  config.vm.define "web" do |web|
    web.vm.provider "virtualbox" do |v|
      v.name = "web-1"
      v.memory = 1024
      v.cpus = 1
      v.customize ["modifyvm", :id, "--description", "This is an ubuntu server"]
    end  
    web.vm.hostname = "web-1"
    web.vm.network "private_network", ip: "172.16.0.20"
    web.vm.provision "shell", path: "scripts/web.sh"
  end 
end
