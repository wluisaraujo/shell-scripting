#!/bin/bash
# Curso 451 - 4Linux - Luís Araújo - 2013
echo -e "

              1- Item 1

              2- Item 2

              3- Item 3 "

echo -n "Escolha uma opção:  "
read OPT

case $OPT in
   1) echo "Executando Funcionalidade 1"
   ;;
   2) echo "Executando Funcionalidade 2"
   ;;
   3) echo "Executando Funcionalidade 3"
   ;;
   *) echo "Opção Invalida"
   ;;
esac
