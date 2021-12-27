#!/bin/bash
source components/common.sh

print "installing nodejs\t"
yum install nodejs make gcc-c++ -y &>>$LOG
Status_Check $?

print "Adding roboshop user\t"
id roboshop &>>$LOG
if [ $? -eq 0 ]; then
echo "user already there so skipping" &>>$LOG
else
useradd roboshop
fi
Status_Check $?

print "Downloading catalogue\t"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
Status_Check $?

print "extractng catalogue archive"
cd /home/roboshop
rm -rf catalogue && unzip -o /tmp/catalogue.zip &>>$LOG && mv catalogue-main catalogue
Status_Check $?

print "download nodejs dependencies"
cd /home/roboshop/catalogue
npm install --unsafe-perm &>>$LOG # should not run as root user so 
Status_Check $?

chown roboshop:roboshop -R /home/roboshop # to change the owner from root to roboshop

print "setup systemd service"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service && systemctl daemon-reload && systemctl start catalogue && systemctl enable catalogue &>>$LOG
Status_Check $?

