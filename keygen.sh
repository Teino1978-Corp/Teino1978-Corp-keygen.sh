#!/bin/bash 

set -e

TMP=$(mktemp -d)

cd "$TMP"

ssh-keygen -f rsa -t rsa -q -N "" -C "rsa"
ssh-keygen -f dsa -t dsa -q -N "" -C "dsa"

echo "ssh::ssh_host_rsa_key: |"
cat ./rsa | sed -e "s/^/  /"

echo 

echo "ssh::ssh_host_rsa_key_pub: |"
cat ./rsa.pub | sed -e "s/^/  /"

echo 

echo "ssh::ssh_host_dsa_key: |"
cat ./dsa | sed -e "s/^/  /"

echo 

echo "ssh::ssh_host_dsa_key_pub: |"
cat ./dsa.pub | sed -e "s/^/  /"

rm -rf "$TMP"