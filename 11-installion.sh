#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "please run this script with root previleges"
    exit 1
fi

dnf list installed mysql # Just checking whether installed or not

if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it"
    dnf install mysql -y # here installing
    if [ $? -ne 0 ]
    then
        echo "Mysql installation is not success. check it please"
        exit 1
    else
        echo " Mysql installation is successful"
    fi

else
echo "mysql is already installed nothing to do ..."
fi
