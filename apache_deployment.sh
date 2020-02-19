#!/bin/bash

user="$USER"
keyfile="/home/$user/.ssh/ansible_key"

echo "Creating ansible folder"
mkdir /home/$user/ansible
ansible_path="/home/$user/ansible"

echo "Initial check if playbook is in the ansible folder"
playbook="$ansible_path/apache.yml"

if test -f $playbook;
    then
            echo "$playbook exists in the ansible folder"
    else
            echo "Copying playbook"
            cp apache.yml $ansible_path/
    fi


#collect data for ansible
read -p "Username of remote host: " remote_host
echo "--ask-su-pass for sudo - leave blank for no additional parameters"
read -p "zusätzliche Parameter: " par_var

ansible-playbook -u $remote_host -i /etc/ansible/hosts $par_var --key-file=$keyfile $playbook
