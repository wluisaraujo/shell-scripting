#!/bin/bash
## Faculdade Sumaré 
## 2010
clear
echo
echo
echo "Digite o nome do diretório do Backup."
echo
read dirbkp
mkdir $HOME/$dirbkp
echo
cp * $HOME $HOME/$dirbkp
echo
echo
echo
echo
