#!/bin/bash

##input can be taken in two ways
# during execution - can be done by read command

read -p "Enter your name: " name
echo "your name is ${name}"

# problem in above approach is some one should manually give the input, if someone is there to manually enter input then only use this command