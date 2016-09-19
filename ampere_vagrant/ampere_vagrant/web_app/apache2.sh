#!/usr/bin/env bash
# Custom script to install apache2 on instance
# Author : Pooja Shah
sudo apt-get update
sudo apt-get install -y apache2
sudo cp /vagrant/web_app/index.html /var/www/html/
sudo /etc/init.d/apache2 restart
