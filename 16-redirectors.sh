#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FOLDER="$LOGS_FOLDER/$SCRIPT_NAME/$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

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

usage () {
    echo -e "$R Usage:: $N sudo sh 16-redirectors.sh package1 package2 ......"
    exit 1
}


check_root

if [ $# -eq 0 ]
then 
    usage
fi

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


