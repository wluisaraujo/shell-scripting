#!/bin/bash

cp -v /etc/passwd /etc/backup/etc/bkp_passwd_$(date +%d-%m-%y).txt

for U in $(getent passwd | awk -F: '{print $1}' | grep -v root | grep -v wluisaraujo)
	do
	echo "Remover Shell do usuário $U"
	usermod -s /bin/false $usuarios
done

