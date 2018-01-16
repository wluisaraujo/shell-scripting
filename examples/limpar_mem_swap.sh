#!/bin/bash

echo "$(/bin/date) - Iniciando Limpeza do Swap" >> /var/log/swapclean.log 2>> /dev/null
echo
echo "Status da memória em $(/bin/date)" >> /var/log/swapclean.log 2>> /dev/null
        free -mt  >> /var/log/swapclean.log 2>> /dev/null
echo
        echo "3" > /proc/sys/vm/drop_caches
        echo "10" > /proc/sys/vm/swappiness
        swapoff -a
	swapon -a
        swapon /dev/mapper/rootvg-swaplv
        
echo
echo "Status da memória em $(/bin/date)" >> /var/log/swapclean.log 2>> /dev/null
        free -mt  >> /var/log/swapclean.log 2>> /dev/null
echo
echo "$(/bin/date) - Encerrando Limpeza do Swap" >> /var/log/swapclean.log 2>> /dev/null
