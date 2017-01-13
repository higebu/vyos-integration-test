#!/bin/bash

sudo apt-get update
sudo apt-get -qqy build-dep vagrant ruby-libvirt
sudo apt-get -qqy install qemu-system-x86 qemu-utils libvirt-bin ebtables dnsmasq
sudo apt-get -qqy install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev
sudo adduser $USER libvirtd
wget https://releases.hashicorp.com/vagrant/1.8.7/vagrant_1.8.7_x86_64.deb && sudo dpkg -i vagrant_1.8.7_x86_64.deb
vagrant plugin install vagrant-vyos
vagrant plugin install vagrant-libvirt --plugin-version 0.0.35 # to avoid https://github.com/vagrant-libvirt/vagrant-libvirt/issues/669
sudo gem install bundler
bundle install
