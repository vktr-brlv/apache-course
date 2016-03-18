# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "chef/centos-6.5"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.network "public_network"

  config.vm.synced_folder "./puppet", "/etc/puppet"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    sudo yum update
    sudo yum install -y --nogpgcheck epel-release
    sudo yum install -y --nogpgcheck puppet rubygems
    sudo puppet apply /etc/puppet/manifests/wordpress.pp
    sudo cp -r /vagrant/wordpress /var/www/html/
    ip addr show eth1
  SHELL
end
