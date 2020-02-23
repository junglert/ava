# apache via ansible / ava
Apache Website that gets deployed via ansible
### For now, you need to manually install ansible
### Please install it via your packagemanager (yum, zypper, apt, dpkg, etc...)
***
# Configuring ansible
  
  ## Edit the ansible hosts file in /etc/ansible/
  
  Uncomment the line containing '[webservers]'
  
          ##[webservers]
          ##120.0.0.0
          ##120.0.0.1
          
  and add the IP address of your remote host beneath of the default IP addresses
  
  ## Generate a new ssh-key for ansible
  
      ssh-keygen
      
  Follow the instructions and create your new key
  
  ## Copy your new key onto the remote host/s
  
  For Example:
  
      ssh-copy-id -i <PATH_TO_THE_PUBLIC_KEY> username@hostname
      
  After this initial configuration we can continue with the main isntallation process
***
# How to install and get started
  
  Clone this git-repo:
  
         git clone https://github.com/junglert/apache_via_ansible.git

    
  Execute the script
              
          bash apache_deployment.sh         
    
  The script automatically creates and copies needed folders and files into your home directory.
  If everything already is in place, the script will skip this part and proceed with the next step.
  
  You will be asked for the username to login into the remote host.
  
  The script now asks if you want to give any additional parameters, for installing things you need to become the superuser of the machine, enter the following parameter:
  
           -K
  
  After entering the password of the remote host, ansible should setup the website.
  
# What else can you do with this script?

  You can use any .yml playbook and deploy it via this script.
  Just simply change the path in the variable.
  
***    
# Future plans
   
   - automatically installes ansible if not already installed
     
   - creating a wiki / manual 
    
