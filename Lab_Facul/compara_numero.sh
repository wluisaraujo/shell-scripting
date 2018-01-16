#!/bin/bash
## Faculdade Sumaré 
## 2010
clear
echo "Comparando números."
echo "Digite o 1º número."
read num1
echo "Digite o 2º número."
read num2
echo "Digite o 3º número."
read num3
echo
echo
if [ $num1 -gt $num2 ];
    then
	if [ $num1 -gt $num3 ];
	    then
	    echo "             $num1 é maior"
	fi
    else
	if [ $num2 -gt $num3 ];
	    then
	    echo "             $num2 é maior"
	    else
	    echo "             $num3 é maior."
	    fi
fi
