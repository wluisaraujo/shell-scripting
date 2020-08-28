#!/bin/bash


printf "Digite a nova versão\n"
read NEWVERSION

if [ -z ${NEWVERSION} ]
  then
    printf "${NEWVERSION}\n"
	  printf "Versao não definida\n" && exit 1
  else
    printf "Nova versão do Theme ${NEWVERSION}\n"
    
    mkdir /tmp/${NEWVERSION} \
    && touch /tmp/${NEWVERSION}/empty
    
    aws --profile Admin s3 \
    cp /tmp/${NEWVERSION}/empty \
    s3://static-prd.content.com.br/theme/${NEWVERSION}/empty \
    
    && aws --profile Admin \
    s3 sync s3://static-hml.content.com.br/theme/${NEWVERSION} \
    s3://static-prd.content.com.br/theme/${NEWVERSION} \
    
    && aws --profile Admin \
    s3 rm s3://static-prd.smiler.com.br/theme/${NEWVERSION}/empty
fi
