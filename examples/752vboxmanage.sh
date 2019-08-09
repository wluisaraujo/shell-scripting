#!/bin/bash

export APPDIR="/home/repositorio/FREQUENTES/752"
export OVAFILE="parte1.ova parte2.ova parte3.ova"

## import VM
for VM in $OVAFILE 
  do  vboxmanage import $APPDIR/$VM
done

# criar NIC rede interna
#vboxmanage create hostonlyif

# associar rede nat e interna
#VBoxManage modifyvm vmtest --ostype  "Linux26_64" --memory 4096 --acpi on --cpus 1  --description "VM Test"
#VBoxManage modifyvm OracleLinux6Test --nic1 bridged --bridgeadapter1 eth0
#VBoxManage modifyvm <vmname> --intnet<X> <network_name>.
