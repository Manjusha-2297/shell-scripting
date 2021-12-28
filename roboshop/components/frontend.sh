#!/bin/bash

source components/common.sh

print "Install nginx"
yum install nginx -y &>>$LOG
Status_Check $?

print "Download frontend archive"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG
Status_Check $?

print "Extract frontend archive"
rm -rf /usr/share/nginx/* && cd /usr/share/nginx && unzip -o /tmp/frontend.zip &>>$LOG && mv frontend-main/* . && mv static/* . &>>$LOG
Status_Check $?

print "Update nginx config file"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG
Status_Check $?

print "restart Nginx"
systemctl restart nginx &>>$LOG && systemctl enable nginx &>>$LOG
Status_Check $?