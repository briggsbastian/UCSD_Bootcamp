#!/bin/bash

#  http://ipinfo.io/104.223.95.86
#ip = 104.223.95.86
#ip1 = 133.18.55.255
#ip2 = 42.34.55.255

#only country
curl -s http://ipinfo.io/$1 | grep -i country 

# awk -F: '{print $1}'
