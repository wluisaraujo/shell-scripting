#!/bin/bash
USER=$( dialog --stdout --menu 'Calculadora:' 0 0 0  \
 1 Somar \
 2 Subtrair \
 3 Dividir \
 4 Multiplicar )

VALOR1=$(dialog --stdout \
                --title 'Calculadora' \
                --inputbox 'Digite o primeiro valor:' 0 0)
VALOR2=$(dialog --stdout \
                --title 'Calculadora' \
                --inputbox 'Digite o Segundo valor:' 0 0)
case $USER in
1)echo "o resultado da conta eh `expr $VALOR1 + $VALOR2`" > /tmp/resultado.txt
dialog  --backtitle 'Somar'     --title         'RESULTADO'     --textbox       /tmp/resultado.txt      0       0
;;
2)echo "o resultado da conta eh `expr $VALOR1 - $VALOR2`" > /tmp/resultado.txt
dialog  --backtitle 'Subtrair'  --title         'RESULTADO'     --textbox       /tmp/resultado.txt      0       0
;;
3)echo "o resultado da conta eh `expr $VALOR1 / $VALOR2`" > /tmp/resultado.txt
dialog  --backtitle 'Subtrair'  --title         'RESULTADO'     --textbox       /tmp/resultado.txt      0       0
;;
4)echo "o resultado da conta eh `expr $VALOR1 \* $VALOR2`" > /tmp/resultado.txt
dialog  --backtitle 'Subtrair'  --title         'RESULTADO'     --textbox       /tmp/resultado.txt      0       0
;;
esac

