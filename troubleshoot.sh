#!/usr/bin/env bash

on the master/ca server you need to run:

puppet cert clean client-certname

on the client rm -rf /var/lib/puppet/ssl

then on the client:

puppet agent --server servername --waitforcert 60

if you dont have autosign enabled then on the server run puppet cert sign certname..

cheers Stuart


master:
find /var/lib/puppet/ssl -name mongodb0.pem -delete


agent:
find /var/lib/puppet/ssl -name '*.pem' -delete
puppet agent -t --waitforcert=60
puppet cert sign mongodb0





ALternate Sign
--------------------
puppet cert sign --all
puppet cert sign mongodb0
puppet cert --allow-dns-alt-names sign devil
