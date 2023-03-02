#! /bin/bash
cd ~

sudo apt install apache2 -y

read -p "Enter the name of your domain/website: " NAME

sudo mkdir /var/www/$NAME

sudo chown -R $USER:$USER /var/www/$NAME

read -p "Enter the Domain of your website: " DOMAIN

sudo echo "<VirtualHost *:80>
    ServerName $DOMAIN
    ServerAlias www.$DOMAIN
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/$NAME
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" | sudo tee /etc/apache2/sites-available/$NAME.conf

sudo a2ensite $NAME
sudo a2dissite 000-default
sudo systemctl reload apache2
