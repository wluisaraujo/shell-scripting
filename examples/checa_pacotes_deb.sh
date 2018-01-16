#!/bin/bash

dpkg -l | awk '{print $2,$3}' | sed '1,5d' >> /tmp/pacotes_instalados_$(hostname -s)_$(date +%d-%m-%Y).txt 2> /dev/null
