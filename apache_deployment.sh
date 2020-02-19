#!/bin/bash

user="$USER"
keyfile="/home/${user}/.ssh/ansible_key"
ansible_path="/home/${user}/ansible/"

playbook="${ansible_path}apache.yml"

read -p "Username of remote host: " remote_host
echo "--ask-su-pass for sudo - leave blank for no additional parameters"
read -p "zusätzliche Parameter: " par_var

ansible-playbook -u ${remote_host} -i /etc/ansible/hosts ${par_var} --key-file=${keyfile} ${playbook}
