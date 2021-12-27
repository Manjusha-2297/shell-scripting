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