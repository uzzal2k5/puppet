#!/usr/bin/env bash
yum install -y puppet-server

yum remove -y ruby-devel rubygems gcc-c++ curl-devel zlib-devel make automake  openssl-devel
yum remove $(rpm -qa | grep gem)



#rm -rf /etc/puppet
rm -rf $(find / -name 'puppet')
yum remove $(rpm -qa | grep gem)
