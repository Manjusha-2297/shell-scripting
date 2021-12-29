#!/bin/bash

## If we need to execute a set of commands continously in a iterative way then we use loops.

# while  (Inverse logic of while is until loop)
# for    (Inverse logic of for is select loop)

# while [ expression ]; do
  # Commands
# done

i=10
while [ $i -gt 0 ]; do
  echo "Hello $i"
  i=$(($i-1))
done

# for var in val1 val2 val3 ; do
   # commands
# done

COMPONENTS=(frontend mongodb catalogue redis user cart mysql shipping rabbitmq payment)
for comp in ${COMPONENTS[*]} ; do
  echo "Started Setting Up $comp"
  echo "End of $comp Setup"
done