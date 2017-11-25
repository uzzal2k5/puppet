#!/usr/bin/env bash

openssl genrsa -out /etc/pki/tls/private/talent-test-key.key
openssl req -new -key /etc/pki/tls/private/talent-test-key.key -out /etc/pki/tls/private/talent-test-csr.csr
openssl x509 -req -days 365 -in /etc/pki/tls/private/talent-test-csr.csr -signkey /etc/pki/tls/private/talent-test-key.key -out /etc/pki/tls/certs/talent-test-crt.crt

talent-test.sam-media.com


curl --insecure -v https://talent-test.sam-media.com 2>&1 | awk 'BEGIN { cert=0 } /^\* Server certificate:/ { cert=1 } /^\*/ { if (cert) print }'

curl --insecure -v https://sam-test 2>&1 | awk 'BEGIN { cert=0 } /^\* Server certificate:/ { cert=1 } /^\*/ { if (cert) print }'



openssl s_client -connect talent-test.sam-media.com:443