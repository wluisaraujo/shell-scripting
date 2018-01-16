#!/bin/bash
# 64 bytes from 172.28.126.46: icmp_seq=2 ttl=64 time=0.109 ms

TTL=$(ping -c3  $1  | grep -i ttl | tail -n1 | awk '{print $6}')

echo "O $TTL"
if [ $TTL = 'ttl=64' ] 
  then
	echo "O sistem é linux com  $TTL"
		else
	echo "O sistem é windows com  $TTL"
fi
