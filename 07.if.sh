#!/bin/bash

read -p "enter some input: " input
if [ -z $input ]; then
echo "you have not provided any input"
exit 1
fi

if [ $input == "ABC" ]; then
echo "input you have provided is ABC"
fi

echo "input - $input"

if [ $? -eq 0 ]; then
echo "success"
else
echo "Failure"
fi

read -p "enter file name: " file

if [ -e $file ]; then
echo "file exist"
else
echo "file does not exist"
fi

