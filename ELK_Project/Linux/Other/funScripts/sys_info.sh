#!/bin/bash
echo "This is my first script"
date
echo "The machine type is:"
echo -e "$MACHTYPE\n"
echo -e "\nThe uname info for the machine is:"
uname -a
echo -e "\nThe ip address for this machine is:"
hostname -I | awk '{print $1}'
echo -e "\nThe hostname for this machine is:"
echo -e "$HOSTNAME\n"
echo "DNS info:"
cat /etc/resolv.conf
echo "Memory info:"
free
echo "CPU info:"
lscpu | grep -i cpu | head -5 | tail -1
echo "Disk usage:"
df -H
echo "Logged in users:"
echo $(who)
# mkdir ~/research
# find / -type f -perm 777 2> /dev/null | wc -l
# ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
