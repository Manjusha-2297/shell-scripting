#!/bin/bash

# special variables are from $0 to $n

echo $0 # script name will be printed
echo $1 # first argument to the script
echo $2 # second argument to the script
echo $* # give all the arguments
echo $@ # same as $*
echo $# # give the no.of arguments