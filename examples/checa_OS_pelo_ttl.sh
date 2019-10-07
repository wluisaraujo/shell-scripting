#!/bin/bash

TTL=$(ping -c3  $1  | grep ttl| tail -n1 | awk '{ print $6 }')

echo "O TTL de $1 é $TTL"
if [ $TTL = "ttl=64" ] 
  then
    echo "O host $1 é tem o $TTL é um sistema linux"
  else
    echo "O host $1 é tem o $TTL é um sistema Windows"
fi
