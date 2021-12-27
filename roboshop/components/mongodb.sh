#!/bin/bash

Status_Check() {
    
    if [ $1 -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
    else
    echo -e "\e[31mFAILURE\e[0m"
    exit 2 # if there is any failure 
    fi
    
}
echo "setting up mongodb repo"

echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
Status_Check $?

echo "Installing mongodb"
yum install -y mongodb-org &>>/tmp/log # sending the output to the /tmp/log file
Status_Check

echo "Configuring mongodb"
# Update Liste IP address from 127.0.0.1 to 0.0.0.0 in config file
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
# Config file: /etc/mongod.conf
Status_Check $?

echo "starting mongodb"
systemctl enable mongod
systemctl start mongod
Status_Check $?

echo "Downloading mongodb schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
Status_Check $?

cd /tmp
echo "extracting schema archive"
unzip -o mongodb.zip  &>>/tmp/log # -o to over ride the file rather than asking every time
Status_Check $?
cd mongodb-main
echo "Loading schema"
mongo < catalogue.js &>>/tmp/log
mongo < users.js &>>/tmp/log
Status_Check $?

exit 0
