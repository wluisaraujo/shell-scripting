#!/bin/bash
clear
echo "Informe os dados com MUITA ATENCAO!!!!"

echo -en "Quantidade de Maquinas da Sala (Ex. 12, 14): "
read IP

echo -en "Periodo em minusculo (Ex. matutino, vespertino, diurno, etc): "
read PERIODO

#echo -en "Numero do Curso (Ex. 450): "
#read CURSO

test ! -z $IP || exit
test ! -z $PERIODO || exit
#test ! -z $CURSO || exit

echo -e "\nComandos a Serem executados nas Máquinas 1 a $IP. Vc tem certeza? \n"
#  echo "ssh 192.168.200.X echo -e 4linux\n4linux | passwd $PERIODO "
  echo ssh 192.168.200.X rm -rf /home/$PERIODO
  echo ssh 192.168.200.X tar xf /etc/skel/$PERIODO* -C /home
  echo ssh 192.168.200.X "su $PERIODO -c '/usr/bin/vboxmanage import /home/repositorio/$CURSO/$CURSO.ova'"

echo -en "\nCTRL+C para Cancelar /  Enter para Continuar\n"
read

for MAQ in $(seq 1 $IP) 
do
   echo Maquina: $MAQ
#  ssh 192.168.200.$MAQ "echo -e '4linux\n4linux' | passwd $PERIODO "
#  ssh 192.168.200.$MAQ rm -rf /home/$PERIODO
#  ssh 192.168.200.$MAQ tar xf /etc/skel/$PERIODO* -C /home
   scp DesktopLinux.ova 192.168.200.$MAQ:/home/repositorio/
   ssh 192.168.200.$MAQ chmod 777 /home/repositorio/DesktopLinux.ova
   ssh 192.168.200.$MAQ "su $PERIODO -c '/usr/bin/vboxmanage import /home/repositorio/DesktopLinux.ova'"

done 
