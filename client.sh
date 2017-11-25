#!/usr/bin/env bash

rpm -ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm
yum install -y puppet



vim /etc/hosts
10.10.0.199 devil.ipvbd.com
10.10.0.138 mongodb0
10.10.0.55  sam-test


vim /etc/puppet/puppet.conf

# In the [agent] section

    server = puppet-server #Should be the FQDN!
    report = true
    pluginsync = true


# Puppet aGENT RUN ON BOOT
chkconfig puppet on
puppet agent --daemonize


# tEST cLIENT
puppet agent -t

# Check and apply from The Puppet-master:
puppet cert list
puppet cert sign --all
