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
    echo -e " $R please run this script with root previleges $N "
    exit 1
fi

}

Check_root 

Validate() {
    if [ $1 -ne 0 ]
    then
        echo -e " $R $2 is... failure $N "
    else
        echo -e " $Y $2 is... success... $N "
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