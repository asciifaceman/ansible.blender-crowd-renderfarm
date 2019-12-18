#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# vi: set ft=ruby :

require 'etc'
require 'shellwords'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "devel"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", type: "dhcp"
  #config.vm.network "forwarded_port", guest: 80, host: 8080
  #config.vm.network "forwarded_port", guest: 443, host: 443

  # Tweak the VMs configuration.
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = Etc.nprocessors
    vb.memory = 1024
    vb.linked_clone = true
  end

  # Configure the VM using Ansible
  # We are using ansible provisioner instead of ansible_local to pull
  # down the dependencies outside of vagrant
  config.vm.provision "ansible" do |ansible|
    #ansible.galaxy_roles_path = ".ansible/galaxy-roles"
    #ansible.provisioning_path = "/vagrant"
    ansible.galaxy_role_file = "requirements.yml"
    ansible.playbook = "vagrant.yml"
    # allow passing ansible args from environment variable
    #ansible.raw_arguments = Shellwords::shellwords(ENV.fetch("ANSIBLE_ARGS", "--vault-password-file ~/.ansible_vault"))
  end
end