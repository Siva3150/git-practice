#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]
then 
echo "The given number:: $NUMBER is greater than 20"
else
echo "The given number:: $NUMBER is less than 20"
fi