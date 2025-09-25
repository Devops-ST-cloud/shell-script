#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "exit status :: $1"
    echo "what is installing :: $2"
}

if [ $USERID -ne 0 ]
  then 
      echo "please run the script as root user"
      exit 1
   else
      echo "you are super user"
fi         

dnf install mysql -y
VALIDATE $? "Installing Mysql"

dnf install git -y
VALIDATE $? "Installing git"
