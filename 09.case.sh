#!/bin/bash

UNAME=$(uname)

case $UNAME in
  Linux)
    echo "This is a Linux Box"
    ;;
  AIX)
    echo "This is a AIX Unix Box"
    ;;
  Darwin)
    echo "This is a MacOS Unix Box"
    ;;
  *)
    echo "Unknown OS"
    ;;
esac