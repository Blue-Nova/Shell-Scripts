#! /bin/bash

sudo apt install ufw -y
sudo apt install letsencrypt -y
sudo apt install certbot python3-certbot-apache -y

sudo ufw allow 80
sudo ufw allow 443

read -p 'Enter your domain: ' DOMAIN

sudo certbot --apache -d $DOMAIN -d www.$DOMAIN
