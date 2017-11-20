#!/bin/bash -v
yum install epel-release -y
yum install python-pip -y
pip install ansible
ansible-galaxy install dwhitehead-splk.unbound
mkdir ~/ansible
cat >~/ansible/unbound.yml <<EOL
---
- hosts: all
  roles:
  - dwhitehead-splk.unbound
EOL
ansible-playbook -i "localhost," -c local ~/ansible/unbound.yml --extra-vars "domain=gelato.splunk.com"
