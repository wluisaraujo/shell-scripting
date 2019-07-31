#!/bin/bash

## Description:
## Checking readonly status of mount points set in /etc/fstab,
## ignoring >> blank lines, commented lines, remote paths, numbered lines, swap
## 
## w.luis.araujo@gmail.com - Jul/2019

for x in $(egrep -v '^$|^#|^//|swap|^0|^1|^2|^3|^4|^5|^6|^7|^8|^9' /etc/fstab | awk '{print $2}')
  do
    sudo touch $x/filesystem.log &> /dev/null
    if [ -f $x/filesystem.log ]
      then
        sudo rm -f $x/filesystem.log 2> /dev/null
# 0 is success
		echo '0'
      else
# 1 is is failed
      echo '1'
    fi
done | grep --color '1'
