#!/usr/bin/env bash

rpm -ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm
yum install -y puppet-server
# Install Utils Package
yum install -y policycoreutils-python lsof

systemctl start  puppetmaster.service
puppet resource service puppetmaster ensure=running enable=true

# Give Puppet correct permission to access the Rack config:
mkdir -p /usr/share/puppet/rack/puppetmasterd/public /use/share/puppet/rack/puppetmasted/tmp
cp  /usr/share/puppet/ext/rack/files/config.ru /usr/share/puppet/rack/puppetmasterd/
chown puppet:puppet /usr/share/puppet/rack/puppetmasterd/config.ru

# Start
systemctl restart puppetmaster

semanage port -a -t puppet_port_t -p tcp 8140
# Add the puppet https Port to the firewall:
firewall-cmd --zone=public --add-port=8140/tcp --permanent
firewall-cmd --reload

# Check port is listening
lsof  -i tcp:8140


# Append
vim /etc/puppet/puppet.conf
[master]
certname = sam-test # Certificate name Use the FQDN here
# autosign = true
autosign = autosign.conf

echo "devil.ipvbd.com" > autosign.conf







