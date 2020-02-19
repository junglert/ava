#!/bin/bash

user="$USER"
keyfile="/home/$user/.ssh/ansible_key"

echo "Creating ansible folder"
mkdir /home/$user/ansible

ansible_path="/home/$user/ansible"

echo "Copying playbook into ansible folder if it´s not already there"
cp apache.yml $ansible_path/
playbook="$ansible_path/apache.yml"

read -p "Username of remote host: " remote_host
echo "--ask-su-pass for sudo - leave blank for no additional parameters"
read -p "zusätzliche Parameter: " par_var

ansible-playbook -u $remote_host -i /etc/ansible/hosts $par_var --key-file=$keyfile $playbook
