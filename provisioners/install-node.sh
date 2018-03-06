#!/bin/bash

#nodesource PPA
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
#update package database
sudo apt-get update
#install NodeJS
sudo apt-get install -y nodejs
#install PM2 to support NodeJS application run-as-service
sudo npm install -g pm2
