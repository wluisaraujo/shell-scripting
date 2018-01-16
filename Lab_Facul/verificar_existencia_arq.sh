#!/bin/bash
## Faculdade Sumaré 
## 2010
clear
arq=lixo
if test -e $home/$arq; then
echo "Arquivo existe."
echo "Olha o arquivo."
ls $home
else
echo "Arquivo não existe."
echo "Criando arquivo."
touch $home/lixo
fi
