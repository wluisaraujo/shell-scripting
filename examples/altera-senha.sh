#!/bin/bash

for usuarios in $(getent passwd | awk -F: ' $3 >= 1000 {print $1}'); do

#Aplica politica de senha
  chage -M 30 -W 5 -I 2 $usuarios

done

