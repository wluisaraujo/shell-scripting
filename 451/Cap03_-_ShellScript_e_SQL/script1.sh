#!/bin/bash
# Curso 451 - 4Linux - Luís Araújo - 2013

USUARIO=aluno
echo $USUARIO
A=10
B=20

echo “O resultado da soma é `expr $A + $B`”
echo “O resultado da soma é $(expr $A + $B)”
echo 'O resultado da soma é $(expr $A + $B)'
