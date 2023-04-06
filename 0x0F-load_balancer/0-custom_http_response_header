#!/usr/bin/env bash

# Configure Nginx of custom header (on web-01 and web-02)
# Custom HTTP header must be X-Served-By
# Value of the custom HTTP header must be the hostname of the server Nginx is running on

sudo apt-get update
sudo apt-get -y install nginx

# configures firewall to allow request through port 80
sudo ufw allow 'Nginx HTTP'

sudo mkdir -p /var/www/html

# change permissions to allow files to be created in this dir
sudo chmod -R 755 /var/www

#  creates the index page
echo 'Hello World!' |sudo tee  /var/www/html/index.html

# creates a webpage for error 404
echo "Ceci n'est pas une page" |sudo tee /var/www/html/404.html

# configure redirect for a single page(/redirect_me) and add header to display hostname
string_for_replacement="server_name _;\n\tadd_header X-Served-By \$hostname;\n\trewrite ^\/redirect_me https:\/\/www.codenrise.tech permanent;"
sudo sed -i "s/server_name _;/$string_for_replacement/" /etc/nginx/sites-enabled/default

# configure redirect for 404 error page
string_for_replacement="listen 80 default_server;\n\terror_page 404 \/404.html;\n\tlocation = \/404.html {\n\t\troot \/var\/www\/html;\n\t\tinternal;\n\t}"
sudo sed -i "s/listen 80 default_server;/$string_for_replacement/" /etc/nginx/sites-enabled/default

# restart the web server after updating the settings
sudo service nginx restart