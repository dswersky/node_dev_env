#install ngx-rocket
sudo npm install -g generator-ngx-rocket
#change to app directory
cd /home/vagrant/
mkdir starter_app
cd starter_app
#copy app definition file
mv /home/vagrant/files/ngx.json .
#take ownership of directory
sudo chown -R $USER:$(id -gn $USER) /home/vagrant/.config
#Create new ngx app from defintion file
ngx new --automate ngx.json
#remove package.json
rm package.json
#copy ecosystem file
mv /home/vagrant/files/ecosystem.config.js .
#get custom package.json
mv /home/vagrant/files/package.json .
#start app
pm2 start ecosystem.config.js
#save pm2 config
pm2 save
pm2 startup
#set up pm2 systemd init
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u vagrant --hp /home/vagrant