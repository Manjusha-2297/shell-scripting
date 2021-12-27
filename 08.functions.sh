#!/bin/bash

# declaring a function

Sample()
{
    a=100
    echo "I am a function"
    echo "value of a in Function is : $a"
    b=20
    echo "First argument in function is $1"
}

# this is main block
# accessing a function
a=10
Sample xyz
b=200
echo "value of b in main program is : $b"
echo "First argument in main is $1"