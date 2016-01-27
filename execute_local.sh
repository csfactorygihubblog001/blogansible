#!/bin/bash



echo "Ansible(local)実行します。"
ansible-playbook  --inventory-file=/etc/ansible/hostslocal ./sitelocal.yml
