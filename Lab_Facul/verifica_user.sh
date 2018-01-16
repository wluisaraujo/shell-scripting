#!/bin/bash
## Faculdade Sumaré 
## 2010
echo "Verificando o usuário."
echo "Digite o nome do aluno."
read nome

if [ $nome = "aluno" ]; then
    echo "é o aluno.";
    lastlog -u $nome
    else
    echo "não é o aluno";
    lastlog -u $nome
fi
