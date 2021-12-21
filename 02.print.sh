#!/bin/bash

# pring msg can be done by two commands
# echo and print
# echo is more user friendly so use echo
# syntax: echo message
echo Hello World
# for printing multiple lines, tab spaces and colours
#\n - new line, \t - tab space, \e - new colour
# for enabling esc sequences need to put -e option with echo and msg has to be double quotes

echo -e "Line1\nLine2"
echo -e "Word3\tWord4"
# for colour - echo -e "\e[colourcodeMessage"
# Red- 31m, Green- 32m, Yellow- 33m, Blue- 34m, Magenta- 35m, Cyan- 36m

echo -e "\e[31mText in red colour"
echo -e "\e[32mText in green colour"

# for text to be bold then 1;code
echo -e "\e[1;31mText in red colour"
echo -e "\e[1;32mText in green colour"

#when echo enable colour it does not disable by default we have to manually disable the colour 
# than can be done by "0"

echo -e "\e[1;35mMessage in colour but disabling after enabling colour\e[0m"
echo no colour

