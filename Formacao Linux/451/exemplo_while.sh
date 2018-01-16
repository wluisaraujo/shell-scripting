#!/bin/bash
 
# while - Enquanto a opção for verdadeira, então faça.


VAR=0 

while [ $VAR -le 10 ]   ; do 
	echo " O numero $a é menor ou igual a 10 "
	VAR=$(($VAR+1))
	sleep 1 ; done
