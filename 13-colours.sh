#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Check_root() {
    if [ $USERID -ne 0 ]
    then
    echo  "please run this script with root previleges"
    exit 1
fi

}

Check_root 

Validate() {
    if [ $1 -ne 0 ]
    then
        echo -e "  $2 is... $R failure $N "
    else
        echo -e "  $2 is... $G success... $N "
    fi
}

dnf list installed mysql # Just checking whether installed or not

if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it"
    dnf install mysql -y # here installing
    Validate $? "Installing mysql"
else
echo "mysql is already installed nothing to do ..."
fi