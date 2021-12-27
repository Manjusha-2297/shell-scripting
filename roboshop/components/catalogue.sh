#!/bin/bash
source components/common.sh

print "installing nodejs"
yum install nodejs make gcc-c++ -y &>>$LOG
Status_Check $?

print "Adding roboshop user"
useradd roboshop
Status_Check $?

print "Downloading catalogue"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
Status_Check $?

cd /home/roboshop
print "extractng catalogue archive"
unzip /tmp/catalogue.zip &>>$LOG
mv catalogue-main catalogue
Status_Check $?

cd /home/roboshop/catalogue
npm install 


# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue