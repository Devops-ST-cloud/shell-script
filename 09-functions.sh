#!/bin/bash

USERID=$(id -u)

VALIDATE(){

   if [ $1 -ne 0 ]
     then 
         echo "$2.... failure"
         exit 1
     else  
         echo "$2.... success"
   fi     
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
