#!/bin/bash

# VARIABLE
#Create an if statement that checks for the existence of the ~/research directory
if [ -d /home/sysadmin/research/ ]
then
	echo "Directory found"
else
	echo "Directory made!"
	mkdir /home/sysadmin/research
fi
if [ -e /home/sysadmin/research/sys_info.txt ]
then
	echo "File not found!"
else
	echo "Removing File"
	rm /home/sysadmin/research/sys_info.txt
fi
#Create an if statement that checks for the existence of the file ~/research/sys_info.txt
