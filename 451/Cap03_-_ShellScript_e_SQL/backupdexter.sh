#!/bin/bash
# Curso 451 - 4Linux - Luís Araújo - 2013


## Validate
# Se nao for especificado o Diretorio como parametro ele cancela o script.
test ! -z $1 || exit

## Variaveis 

SERVER="$(hostname -s)"
DIRECTORY="$1"
TODAY=$(date +%d-%m-%Y)
FILE="bkp_$(echo $DIRECTORY | sed -e 's/\///g')_$SERVER_$TODAY.tar.bz2"

## Begin Script

# Exporta variavel START registrando o horário que começa o backup
export START=$(date +%Y-%m-%d\ %H:%M:%S)

# Armazena no log a hora em que irá iniciar o backup .
echo -e " Backup do $DIRECTORY no $SERVER iniciado as $START " >> /var/log/backup.log


# Faz o backup usando o comando tar com BZIP2
tar cjf /backup/$FILE $DIRECTORY > /dev/null 2> /dev/null

# Exporta variavel END registrando o horário que o backup terminou
export END=$(date +%Y-%m-%d\ %H:%M:%S ) 

# Testa o Backup com o TAR direcionando Saida Padrao e Saida de Erro para /dev/null
tar tjf /backup/$FILE > /dev/null 2> /dev/null

# Condicao que valida se o backup foi realizado com Sucesso ou Nao
if [ $? -eq 0 ]
then
   STATUS="OK"
   echo -e " Backup do $DIRECTORY no $SERVER finalizado em  $END " >> /var/log/backup.log

else
   STATUS="FAIL"
   echo -e " Backup do $DIRECTORY no $SERVER finalizado em  $END " >> /var/log/backup.log
fi 

# Insere os valores no Banco para que possa aparecer no Sistema Web

mysql -u root -p123456 << FINISH
use backup ;
INSERT INTO log (inicio,fim,server,arquivo,status) VALUES ('$START','$END','$SERVER','$FILE','$STATUS');
FINISH
