#!/bin/bash
#author: junglert
#mail:
#date: 19.02.2020
#license: GPL-3.0
#summary: bash script which deploys a website via ansible


#variables
user="$USER"
keyfile="/home/$user/.ssh/ansible_key"
splitter="----------------------------------------------------------------"

#generate folder for files and addons, if not already generated
echo "
Initial check if folder ansible exists
"
ansible_path="/home/$user/ansible"

if [ -d "$ansible_path" ];
    then
            echo -e "Folder already exists \e[32m\u2714 \e[39m
            "
            echo $splitter
    else
            echo "Creating ansible folder in /home/$user/
            "
            mkdir /home/$user/ansible
            echo $splitter
fi


#check if playbook is in the ansible folder
echo "
Initial check if playbook exists in the ansible folder
"
playbook="$ansible_path/apache.yml"

if test -f $playbook;
    then
            echo -e "$playbook exists \e[32m\u2714 \e[39m
            "
            echo $splitter
    else
            echo "Copying playbook into ansible folder
            "
            cp apache.yml $ansible_path/
            echo $splitter
fi


#collect data for ansible
read -p "Username of remote host: " remote_host
echo "
-K for sudo - leave blank for no additional parameters"
read -p "additional parameters: " par_var


#ansible playbook execution
ansible-playbook -u $remote_host -i /etc/ansible/hosts $par_var --key-file=$keyfile $playbook
