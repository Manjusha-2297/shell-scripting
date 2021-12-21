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