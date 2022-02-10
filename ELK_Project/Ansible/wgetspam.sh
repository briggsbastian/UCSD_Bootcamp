#!/bin/bash
while true #end with ctrl^c
do
  wget 10.0.0.5 #web-1
  rm ./*.html
  wget 10.0.0.6 #web-2
  rm ./*.html
  weget 10.0.0.7 #web-3
  rm ./*.html
done
