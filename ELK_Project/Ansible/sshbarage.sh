#!/bin/bash
while true #end with ctrl^c
do
  ssh azadmin@10.0.0.5 #web-1
  ssh azadmin@10.0.0.6 #web-2
  ssh azadmin@10.0.0.7 #web-3
done
