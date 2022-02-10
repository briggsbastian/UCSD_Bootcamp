#!/bin/bash
free | grep -i mem >> ~/backups/freemem/free_mem.txt
df -h >> ~/backups/diskuse/disk_use.txt
ps -aef >> ~/backups/openlist/open_list.txt
df -h | awk -F" " '{print $4}'>> ~/backups/freedisk/free_disk.txt
