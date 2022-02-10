#!/bin/bash
my_list=(/etc/passwd /etc/shadow)

for item in $my_list
do
	ls -l ${my_list[@]}
done
