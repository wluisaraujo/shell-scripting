#!/bin/bash
echo 1 - somar 
echo 2 - subtrair 
echo 3 - dividir 
echo 4 - Vezes 
echo 5 sair do programa
read ESCOLHA

echo "Digite o Primeiro Valor: "
read VALOR1
echo "Digite o segundo Valor: "
read VALOR2

case $ESCOLHA in
1)
echo -e "a soma dos valores $VALOR1 e $VALOR2 eh `expr $VALOR1 + $VALOR2`"
;;
2)
echo -e "a subtração dos valores $VALOR1 e $VALOR2 eh `expr $VALOR1 - $VALOR2`"
;;
3)
echo -e "a divisão dos valores $VALOR1 e $VALOR2 eh `expr $VALOR1 / $VALOR2`"
;;
4)
echo -e "a multiplicação dos valores $VALOR1 e $VALOR2 eh`expr $VALOR1 \* $VALOR2`"
;;
5)
exit
;;
*)
echo "essa não é uma expressão valida"
;;
esac
