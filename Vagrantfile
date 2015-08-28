# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # create mgmt node
  config.vm.define :mgmt do |mgmt_config|
	mgmt_config.vm.box = "ubuntu/trusty64"
	mgmt_config.vm.hostname = "mgmt"
	mgmt_config.vm.network :private_network, ip: "10.0.15.10"
	mgmt_config.vm.provider "virtualbox" do |vb|
		vb.memory = "256"
	end
	mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
  end

  # create web node
  config.vm.define :dev1 do |dev_config|
	dev_config.vm.box = "ubuntu/trusty64"
	dev_config.vm.hostname = "dev1"
	dev_config.vm.network :private_network, ip: "10.0.15.21"

	dev_config.vm.network :forwarded_port, guest: 8000, host: 8001  # Django
	dev_config.vm.network :forwarded_port, guest: 7400, host: 7400  # DeployR
	dev_config.vm.network :forwarded_port, guest: 3838, host: 3838  # Radiant
	dev_config.vm.network :forwarded_port, guest: 5432, host: 15432 # PostgreSQL

	dev_config.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
	end

	dev_config.vm.synced_folder ".", "/vagrant", disabled: true
	dev_config.vm.synced_folder "../miracle", "/home/vagrant/miracle"
	dev_config.vm.synced_folder "../deployr-docker", "/home/vagrant/deployr-docker"
	dev_config.vm.synced_folder "../radiant-docker", "/home/vagrant/radiant-docker"
	dev_config.vm.synced_folder "../analyses", "/opt/miracle"
  end
end
