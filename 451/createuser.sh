#!/bin/bash
# script que cira usuarios

test -e /root/funcionarios.txt || exit 

while read FUNC
	do
 		NOME=$(echo $FUNC | cut ­d";" ­f1 | tr [:upper:] [:lower:] | tr " " ".")
		DEPARTAMENTO=$(echo $FUNC | cut ­d";" ­f2)
		useradd -m -b /srv/homes ­c "$FUNC" -s /bin/bash $NOME
		echo -e "dexter\ndexter" | passwd $NOME
	done < /root/funcionarios.txt

