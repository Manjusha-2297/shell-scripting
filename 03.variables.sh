#!/bin/bash

# assigning a name to set of data is called as variable 
# plain variable variable = data
a=10 # number type data
b=xyz # character type data
c=true #boolean type data
d=abc123 # string type data

# shell will conisder every type of data as string 
# if data is having special characters then it has to be written in double quotes

e="1*2"

# accessing of variables

echo value of a = $a
echo value of b = ${b}
#variables should not start with number it can start with underscore "_"

#DATE=26-12-2021
DATE=$(date +%F)
echo todays date is $DATE

echo value of ABC is ${ABC}

#list variables - variable holds multiple values
b2=(100 100.1 abc)
echo ${b2[0]}
echo ${b2[2]}

# named index/map/Dictonary  - insted of index number call with index name

declare -A new=([colour]=black [fruit]=mango [number]=6)
echo ${new[colour]}
echo ${new[number]}
