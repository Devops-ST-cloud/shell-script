#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
  then 
      echo "please run the script as root user"
      exit 1
   else
      echo "you are super user"
fi

for i in $@
do 
   echo "package install:: $i"
done   