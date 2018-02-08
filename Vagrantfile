# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "kiesel/idev-basebox-jessie64"
  config.vm.box_check_update = false
  # config.vm.network "private_network", ip: "192.168.1.10"
  config.vm.hostname = "box"

  if Vagrant.has_plugin?("vagrant-proxyconf") && ENV['http_proxy']
    config.proxy.http  = "http://10.0.2.2:8888/"
    config.proxy.https = "http://10.0.2.2:8888/"
    config.proxy.no_proxy = "localhost,127.0.0.1,10.0.2.2"
  end

  config.vm.network "forwarded_port", host_ip: "127.0.0.1", guest: 80, host: 80
  config.vm.network "forwarded_port", host_ip: "127.0.0.1", guest: 443, host: 443
  # config.vm.network "forwarded_port", host_ip: "127.0.0.1", guest: 445, host: 445
  config.vm.network "forwarded_port", host_ip: "127.0.0.1", guest: 3306, host: 3306
  config.vm.network "forwarded_port", host_ip: "127.0.0.1", guest: 5432, host: 5432

  for i in 10000..10010
    config.vm.network "forwarded_port", host_ip: "127.0.0.1", guest: i, host: i
  end

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "box"
    # vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "shell", path: "run-ansible.sh", privileged: false
end
