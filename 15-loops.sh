#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

check_root() {
    if [ $USERID -ne 0 ]
    then
    echo  "please run this script with root previleges"
    exit 1
fi

}

validate() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is... $R failure $N"
    else
        echo -e "$2 is... $Y success... $N"
    fi
}

check_root

# sh 15-loops.sh git mysql postfix nginx

for package in $@  # $@ refers to all arguments passed to it
do
  dnf list installed $package
  if [ $? -ne 0 ]
  then 
      echo "installing $package is not installed, going to install it"
      dnf install $package -y
      validate $? "Installing $package"
  else
      echo "$package is already installed nothing to do ..."
  fi

done


