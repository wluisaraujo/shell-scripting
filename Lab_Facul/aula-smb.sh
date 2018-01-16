#!/bin/bash
## Faculdade Sumaré 
## 2010/05/10
clear
# criando diretórios
    cd /srv/
    mkdir /srv/{dpt_vendas,dpt_financeiro,dpt_marketing}
    echo "umask 007" >> /etc/skel/.bash_profile
# Criando os usuários    
    adduser pernalonga
clear
    adduser frajola
clear
    adduser patolino
clear
    adduser coyote

    adduser taz
clear
# Criando os grupos
    addgroup vendedores
    addgroup administradores
    addgroup publicitarios
clear
# Adicionando usuaários aos grupos
    gpasswd -a pernalonga venderores
    gpasswd -a taz venderores
    gpasswd -a coyote administradores
    gpasswd -a frajola publicitarios
clear
# Adicionando Grupo=dono do diretório
cd /srv

    chgrp venderores /srv/dpt_vendas
    chgrp administradores /srv/dpt_financeiro
    chgrp publicitarios /srv/dpt_marketing
clear
# Adicionando permissão
    chmod 2770 /srv/dpt_financeiro
    chmod 2770 /srv/dpt_vendas
    chmod 2770 /srv/dpt_marketing
clear
# verificando as permissões
ls -l /srv

#Saída Esperada
#echo"drwxrws--- 2 root vendedores 4096 2010-05-10 20:29 dpt_venas"
#echo"drwxrws--- 2 root administradores 4096 2010-05-10 20:29 dpt_financeiro"
#echo"drwxrws--- 2 root publicitarios 4096 2010-05-10 20:29 dpt_marketing"
