#!/bin/bash

echo "All variables passed to the script:: $@"

echo "How many variables/arguments passed to the script:: $#"

echo "script name:: $0"

echo "current working directory:: $PWD"

echo "Home directory of current user:: $HOME"

echo "PID of present executing script is:: $$"

sleep 100&
echo "PID of last background command:: $!"