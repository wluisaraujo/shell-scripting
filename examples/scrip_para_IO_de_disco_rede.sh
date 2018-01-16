#!/bin/bash
# Somewhere in 2014
# Variaveis
DFILE="ftp://linuxfreedom.com/tinycore/TinyCore-5.3.iso"
LFILE="/tmp/download.log"

  cd /tmp/
  echo "Começando Download na data $(date)" >> $LFILE 2>> $LFILE
  echo
# O arquivo iso tem 14 Mb
  wget -c $DFILE -O /tmp/arquivo_imagem_$(date +%d%m%y%H%M).iso >> $LFILE 2>> $LFILE
  echo
  echo "Fim do Download na data $(date)" >> $LFILE 2>> $LFILE
# Apaga o arquivo iso
  echo
  rm -fv arquivo_imagem_*.iso >> $LFILE 2>> $LFILE
# Aguarda 4 horas (1440 segundos)
  sleep 1440
