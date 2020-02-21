# apache via ansible / ava
Apache Website that gets deployed via ansible
### For now, you need to manually install ansible
### Please install it via your packagemanager (yum, zypper, apt, dpkg, etc...)
***
# Configuring ansible
  
  ## Edit the ansible hosts file in /etc/ansible/
  
  Delete the # in front of [webservers]
  
          ##[webservers]
          ##120.0.0.0
          ##120.0.0.1
          
  and add the IP of your remote host beneath the default ips
  
  ## Generate a new ansible-ssh-key
  
      ssh-keygen
      
  follow the instructions and create your new key
  
  ## Copy your new key onto the remote host/s
  
      ssh-copy-id -i <NAME OF YOUR KEY> hostname@ip
      
  Everything should be configured now and we can start with the main installation process
***
# How to:
  
  Install this git-repo:
  
         git clone https://github.com/junglert/apache_via_ansible.git

    
  Exec the script, you may have to change the permissions with 
              
          ./apache_deployment.sh         
    
  The script automatically creates and copies needed folders and files into your home directory.
  If everything already is in place, the script will skip this part and proceed with the next step.
  
  In the next step you will be asked how the remote host is named, type in the username and proceed with enter.
  
  The script now asks if you want to give any additional parameters, for installing things you need to become the superuser of the machine, enter the following parameter:
  
           -K
  
  You will be asked to enter the password of the remote host, enter the password and ansible should now setup the website.
  
# What else can you do with this script?:

  You can use any .yml playbook and deploy it via this script.
  Just simply change the path of the variable.
  
***    
# Future plans:
   
   - automatically installes ansible if not already installed
     
   - creating a wiki / manual 
    
