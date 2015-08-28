#!/usr/bin/env bash 

apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible

cp /vagrant/hosts /etc/hosts

if [ ! -f /home/vagrant/.ssh/id_mgmt ]; then
	ssh-keygen -b 2048 -N '' -f /home/vagrant/.ssh/id_mgmt -t rsa -q
	chown vagrant:vagrant /home/vagrant/.ssh/id_*
fi
