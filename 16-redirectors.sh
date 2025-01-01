#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME/$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

check_root() {
    if [ $USERID -ne 0 ]
    then
    echo -e "$R please run this script with root previleges $N" | tee -a $LOG_FILE
    exit 1
fi

}

validate() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is... $R failure $N" | tee -a $LOGFILE
    else
        echo -e "$2 is... $Y success... $N" | tee -a $LOGFILE 
    fi
}

usage () {
    echo -e "$R Usage:: $N sudo sh 16-redirectors.sh package1 package2 ......"
    exit 1
}

echo "Script started executing at: $(date)" | tee -a $LOGFILE


check_root

if [ $# -eq 0 ]
then 
    usage
fi

# sh 15-loops.sh git mysql postfix nginx

for package in $@  # $@ refers to all arguments passed to it
do
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then 
      echo "installing $package is not installed, going to install it" | tee -a $LOGFILE
      dnf install $package -y &>>$LOG_FILE
      validate $? "Installing $package"
  else
      echo -E "$package is already $Y installed nothing to do ... $N" | tee -a $LOGFILE
  fi

done