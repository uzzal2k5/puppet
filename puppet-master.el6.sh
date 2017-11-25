#!/usr/bin/env bash
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install -y puppet-server
# PACKAGE
yum install policycoreutils-python lsof openssl-devel
service puppetmaster start
puppet resource service puppetmaster ensure=running enable=true
mkdir -p /usr/share/puppet/rack/puppetmasterd/public /use/share/puppet/rack/puppetmasted/tmp
configru=$(find /usr/share/puppet confiq.ru)
cp $configru /usr/share/puppet/rack/puppetmasterd/
chown puppet /usr/share/puppet/rack/puppetmasterd/config.ru
# SeLinux Allow
semanage port -a -t puppet_port_t -p tcp 8140
#semanage -a -t httpd_sys_rw_content_t -p tcp 8140
# Firewall Allow
iptables -A INPUT -p tcp --dport 8140 -j ACCEPT
/sbin/service iptables save
iptables -nL


lsof -i tcp:8140
mkdir -p /etc/puppet/modules/motd/{manifests,files}