#!/bin/bash

# Turn off the Firewall and Disable it
/usr/sbin/ufw disable

# Install Puppet Labs Official Repository for Apt based Systems
/usr/bin/wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb /tmp/puppetlabs-release-pc1-trusty.deb
sudo dpkg -i puppetlabs-release-pc1-trusty.deb


/usr/bin/apt-get -qq update
/usr/bin/apt-get install git-core
/usr/bin/apt-get -y install python-software-properties
/usr/bin/add-apt-repository -y ppa:raphink/augeas-1.2.0
/usr/bin/apt-get -y install libaugeas0

# Install Puppet Server Components and Support Packages
/usr/bin/apt-get install puppet-agent

# Restart Networking to Pick Up New IP
/usr/bin/service networking restart

# Create a puppet.conf
cat >> /etc/puppetlabs/puppet/puppet.conf << 'EOF'
certname = trusty.puppet.vm
server = master.puppet.vm
EOF

# Do initial Puppet Run
/opt/puppetlabs/puppet/bin/puppet agent -t
