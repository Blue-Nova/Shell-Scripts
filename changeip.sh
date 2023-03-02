#! /bin/bash
cd ~
sudo apt-get updage -y
sudo apt-get upgrade -y

read -p "Enter your IP address you want to change to static: " IPADDRESS 
read -p "Enter your Gateway IP Address: " GATEWAY
read -p "Enter your Interface Name: " INTERFACE

sudo echo "# This is the network config written by 'subiquity'
network:
  renderer: networkd
  ethernets:
    $INTERFACE:
      addresses:
        - $IPADDRESS/24
      nameservers:
        addresses: [1.1.1.1, 8.8.8.8]
      routes:
        - to: default
          via: $GATEWAY
  version: 2" | sudo tee /etc/netplan/00-installer-config.yaml

sudo netplan apply
ip addr show $INTERFACE

# IP SHOULD CHANGE SUCCESSFULLY AT THIS POINT AND IF YOU ARE USING PUTTY OR ANY SSH CLIENT,
# THE CONNECTION WILL BREAK. RECONNECT SSH WITH YOUR NEW IP ADDRESS.