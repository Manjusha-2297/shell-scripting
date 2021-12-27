#!/bin/bash

source components/common.sh

print "install yum utils & download redis repos"
yum install epel-release yum-utils -y && yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
Status_Check $?

print "Setup redis repos"
yum-config-manager --enable remi &>>$LOG
Status_Check $?

print "install redis"
yum install redis -y &>>$LOG
Status_Check $?

print "Configure redis Listner adress"
sed -i -e 's/127.0.0.1/0.0.0.0/'  /etc/redis.conf
Status_Check $?


print "Start Redis Database"
systemctl enable redis &>>$LOG && systemctl start redis &>>$LOG
Status_Check $?