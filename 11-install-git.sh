#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "please run this script with root previleges"
fi

dnf list installed mysql # Just checking whether installed or not

if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it"
    dnf install mysql -y # here installing
    if [ $? -ne 0 ]
    then
        echo "Mysql installation is not success"
    else
        echo " Mysql installation is successful"
    fi

else
echo "mysql is already installed nothing to do ..."
fi
