#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

if [ $USERID -ne 0 ]
  then 
      echo "please run the script as root user"
      exit 1
   else
      echo "you are super user"
fi

VALIDATE(){

   if [ $1 -ne 0 ]
     then 
         echo "$2.... failure"
         exit 1
     else  
         echo "$2.... success"
   fi     
}

for i in $@
do 
   echo "package install:: $i"
   dnf list installed $i &>>$LOGFILE
   if [ $? -eq 0 ]
   then
       echo "$i already installed"
    else
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "Install $i"
    fi       
done   