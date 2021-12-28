#!/bin/bash

Status_Check() {
    
    if [ $1 -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
    else
    echo -e "\e[31mFAILURE\e[0m"
    exit 2 # if there is any failure 
    fi
    
}

print ()
{
    echo -e "\e[36m\n\t\t................$1........\e[0m\n" &>>$LOG
    echo -n -e "$1\t\t" # to get in the same line
}

if [ $UID -ne 0 ]; then
echo -e "\e[1;31m you should run this as root user\e[0m"
exit 1
fi

LOG=/tmp/roboshop.log
rm -f $LOG # remove previous log and keep fresh log when executed

ADD_APP_USER() {
  print "Adding roboshop user\t"
    id roboshop &>>$LOG
    if [ $? -eq 0 ]; then
    echo "user already there so skipping" &>>$LOG
    else
    useradd roboshop
    fi
    Status_Check $?
  }

DOWNLOAD()
{
    print "Downloading ${COMPONENT}\t"
    curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip"
    Status_Check $?

    print "extractng ${COMPONENT} archive\t"
      cd /home/roboshop
      rm -rf ${COMPONENT} && unzip -o /tmp/${COMPONENT}.zip &>>$LOG && mv ${COMPONENT}-main ${COMPONENT}
      Status_Check $?
}

Systemd_Setup()
{
  print "update systemd service\t"
    sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e  's/MONGO_ENDPOINT/mongodb.roboshop.internal/' -e 's/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/'/home/roboshop/${COMPONENT}/systemd.service
    Status_Check $?

    print "setup systemD service file"
    mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service && systemctl daemon-reload && systemctl restart ${COMPONENT} && systemctl enable ${COMPONENT} &>>$LOG
    Status_Check $?
}

NODEJS() {
  print "installing nodejs\t"
  yum install nodejs make gcc-c++ -y &>>$LOG
  Status_Check $?
  ADD_APP_USER
  DOWNLOAD
  print "download nodejs dependencies"
  cd /home/roboshop/${COMPONENT}
  npm install --unsafe-perm &>>$LOG # should not run as root user so
  Status_Check $?
  chown roboshop:roboshop -R /home/roboshop # to change the owner from root to roboshop
  Systemd_Setup
}