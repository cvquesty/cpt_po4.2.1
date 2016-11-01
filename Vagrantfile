# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

######################
## Puppet Master VM ##
######################
  # Define the Master VM Characteristics
  config.vm.define 'master' do |master|
    master.vm.box = 'puppetlabs/centos-7.2-64-nocm'
    master.vm.network :private_network, :ip => '10.10.100.100'
    master.vm.network "forwarded_port", guest: 443, host: 8443
    master.vm.hostname = 'master.puppet.vm'

  # Configure Master VM Settings
  master.vm.provider :virtualbox do |settings|
    settings.memory = 4608
    settings.name = "master_po4.2.1"
    settings.cpus = 2
  end

  # Add all other hosts for environment
  master.vm.provision :hosts do |entries|
    entries.add_host '10.10.100.100', ['master.puppet.vm', 'master']
    entries.add_host '10.10.100.111', ['centos.puppet.vm', 'centos']
    entries.add_host '10.10.100.112', ['precise.puppet.vm', 'precise']
    entries.add_host '10.10.100.113', ['trusty.puppet.vm', 'trusty']
  end

  # Run the custom provisioning
  master.vm.provision :shell, path: "provision/master.sh"
end

###############
## CentOS VM ##
###############
  # Define the CentOS VM Characteristics
  config.vm.define 'centos' do |centos|
    centos.vm.box = 'puppetlabs/centos-7.2-64-nocm'
    centos.vm.network :private_network, :ip => '10.10.100.111'
    centos.vm.hostname = 'centos.puppet.vm'

  # Configure Development VM Settings
  centos.vm.provider :virtualbox do |settings|
    settings.memory = 512
    settings.name = "centos_po4.2.1"
    settings.cpus = 1
  end

  # Add all other hosts for environment
  centos.vm.provision :hosts do |entries|
    entries.add_host '10.10.100.100', ['master.puppet.vm', 'master']
    entries.add_host '10.10.100.111', ['centos.puppet.vm', 'centos']
    entries.add_host '10.10.100.112', ['precise.puppes.vm', 'precise']
    entries.add_host '10.10.100.113', ['trusty.puppet.vm', 'trusty']
  end

  # Run the custom provisioning
  centos.vm.provision :shell, path: "provision/centos.sh"
end

#######################
## Ubuntu Precise VM ##
#######################
  # Define the Ubuntu VM Characteristics
  config.vm.define 'precise' do |precise|
    precise.vm.box = 'puppetlabs/ubuntu-12.04-64-nocm'
    precise.vm.network :private_network, :ip => '10.10.100.112'
    precise.vm.hostname = 'precise.puppet.vm'

  # Configure Production VM Settings
  precise.vm.provider :virtualbox do |settings|
    settings.memory = 512
    settings.name = "precise_po4.2.1"
    settings.cpus = 1
  end

  # Add all other hosts for environment
  precise.vm.provision :hosts do |entries|
    entries.add_host '10.10.100.100', ['master.puppet.vm', 'master']
    entries.add_host '10.10.100.111', ['centos.puppet.vm', 'centos']
    entries.add_host '10.10.100.112', ['precise.puppes.vm', 'precise']
    entries.add_host '10.10.100.113', ['trusty.puppet.vm', 'trusty']
  end

  # Run the custom provisioning
  precise.vm.provision :shell, path: "provision/precise.sh"
end

######################
## Ubuntu Trusty VM ##
######################
  # Define the Ubuntu VM Characteristics
  config.vm.define 'trusty' do |trusty|
    trusty.vm.box = 'puppetlabs/ubuntu-14.04-64-nocm'
    trusty.vm.network :private_network, :ip => '10.10.100.113'
    trusty.vm.hostname = 'trusty.puppet.vm'

  # Configure Production VM Settings
  trusty.vm.provider :virtualbox do |settings|
    settings.memory = 512
    settings.name = "trusty_po4.2.1"
    settings.cpus = 1
  end

  # Add all other hosts for environment
  trusty.vm.provision :hosts do |entries|
    entries.add_host '10.10.100.100', ['master.puppet.vm', 'master']
    entries.add_host '10.10.100.111', ['centos.puppet.vm', 'centos']
    entries.add_host '10.10.100.112', ['precise.puppes.vm', 'precise']
    entries.add_host '10.10.100.113', ['trusty.puppet.vm', 'trusty']
  end

  # Run the custom provisioning
  trusty.vm.provision :shell, path: "provision/trusty.sh"
end
end
