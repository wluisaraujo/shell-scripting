#!/bin/bash
clear
myIP=$(ifconfig | grep 'inet end' | grep -v '127.0.0.1'| cut -d: -f2| awk '{print $1}')
echo "$myIP"
