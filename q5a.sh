#!/bin/bash
#part a
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
#sudo apt update
#sudo apt install -y git mongodb-org npm nodejs apache2
#sudo service mongod start
git clone https://github.com/cefjoeii/mern-crud.git mern-crud-jp

sudo chown -R "$USER":"$USER" mern-crud-jp

sudo chmod -R 755 mern-crud-jp
sudo cp ~/labexamsol/db.js mern-crud-jp/config/db.js 
cd mern-crud-jp

if [ -f mern-crud.conf ]; then
 sudo rm -rf mern-crud.conf
fi
touch mern-crud-jp.conf

#part b
app_vhost_conf=mern-crud-jp.conf
echo '<VirtualHost *:80>' >> "$app_vhost_conf"
echo  ServerAdmin webmaster@localhost >> "$app_vhost_conf"
echo  ServerName mern.app >> "$app_vhost_conf"
echo  ServerAlias mern.app >> "$app_vhost_conf"
echo  DocumentRoot "$(pwd)" >> "$app_vhost_conf"
echo  ProxyRequests Off >> "$app_vhost_conf"
echo  ProxyPreserveHost On >> "$app_vhost_conf"
echo  ProxyVia Full >> "$app_vhost_conf"
echo  '<Proxy *>' >> "$app_vhost_conf"
echo   Require all granted >> "$app_vhost_conf"
echo  '</Proxy>' >> "$app_vhost_conf"
echo  '<Location />' >> "$app_vhost_conf"
echo   ProxyPass http://127.0.0.1:3000/ >> "$app_vhost_conf"
echo   ProxyPassReverse http://127.0.0.1:3000/ >> "$app_vhost_conf"
echo  '</Location>' >> "$app_vhost_conf"
echo  ErrorLog /var/log/apache2/error.log >> "$app_vhost_conf"
echo  CustomLog /var/log/apache2/access.log combined >> "$app_vhost_conf"
echo '</VirtualHost>' >> "$app_vhost_conf"
sudo mv mern-crud-jp.conf  /etc/apache2/sites-available/mern-crud-jp.conf

#part c
#echo 127.0.0.1 mern.app >> /etc/hosts

#part b
sudo a2ensite mern-crud-jp.conf
sudo a2dissite mern-crud.conf
sudo a2dissite 000-default.conf
sudo a2enmod proxy proxy_http
sudo systemctl restart apache2

#part a
sudo npm install
sudo npm i -g pm2
pm2 delete mern-crud-jp
pm2 start "CORS=1 node server" --name mern-crud-jp
