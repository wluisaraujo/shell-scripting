#!/bin/bash
# Curso 451 - 4Linux - Luís Araújo - 2013

echo "Digite o nome do usuário para consulta:"
read USUARIO

RESULTADO=$( getent passwd | grep $USUARIO)

test -z $RESULTADO

if [ $? -eq 0 ] ;then

   echo "O usuário $USUARIO não existe!"

else

   echo "O usuário existe"

fi
