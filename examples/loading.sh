#!/bin/bash

clear 			# Limpar a tela
echo -n "Loading" 	# Escreva sem pular linha
for i in $(seq 1 1 15); # Laço de repetição FOR repita começando de "1", de 1 em 1 até "15"
do 			# Faça
	echo -n "|" 	# Escreva . sem pular linha
	sleep 0.5 	# Pause 0.5 segundo
	echo -ne "" 	# Gambiarra, atualize a tela
done 			# Feito
clear 			# Limpar a tela
