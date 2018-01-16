#!/bin/bash

case $1 in

start)
	mount -o remount,rw,noexec /var
	mount -o remount,rw,noexec /tmp
	mount | column -t
	echo "Partições SEM permissão de execução"
;;
stop)
	mount -o remount,rw,exec /var ; mount -o remount,rw,exec /tmp
	mount | column -t
	echo "Partições COM permissão de execução"
;;
*) 	echo "erro use $0 {start|stop}"
	exit 0
;;
esac
exit 1
