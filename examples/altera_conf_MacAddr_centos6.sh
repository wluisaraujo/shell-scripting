#!/bin/bash
## Script que altera o Mac Address.
## 28/09/2015

## Variavel do caminho do arquivo de configuração da interface
PATHNIC=/etc/sysconfig/network-scripts/

## Coleta o nome da interface, para configurar
echo "  Digite o nome da placa [Exemplo eth0]"
read NIC

## Checa somente o Mac Address no arquivo de configuracao
OLDMAC=$(grep -i HW $PATHNIC/ifcfg-$NIC | awk -F"=" '{print $2}')

## Checa o Mac Address que está na NIC
NEWMAC=$(ifconfig $NIC | grep -i hw | awk '{print $5}')

## Faz a subistituição de valores no arquivo de configuração
echo "  Subistituindo Mac antigo: $OLDMAC por novo Mac: $NEWMAC no arquivo $PATHNIC/ifcfg-$NIC "
sed -i "s/$OLDMAC/$NEWMAC/g" $PATHNIC/ifcfg-$NIC

echo "  Lendo o arquivo $PATHNIC/ifcfg-$NIC"
echo
cat $PATHNIC/ifcfg-$NIC
