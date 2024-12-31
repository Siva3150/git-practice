#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "please run this script with root previleges"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
echo "mysql is not installed, going to install it"
dnf install mysql -y

if [$? -ne 0 ]
then
echo "Mysql installation is not success"
else
echo " Mysql installation is successful"
fi

else
echo "mysql is already installed nothing to do ..."
fi
