#!/bin/bash
OP=1
while [ $OP -ne 6 ]; do

echo "1 - Listar todos os usuarios"
echo "2 - Listar todos os grupos"
echo "3 - Criar um  novo usuario"
echo "4 - Criar um novo grupo"
echo "5 - Adicionar um usuario a um grupo"
echo "6 - sair do programa"
read OP
case $OP in
1)
/usr/bin/getent passwd | cut -d: -f1
;;
2)
/usr/bin/getent group | cut -d: -f1
;;
3)
echo "Cadastrando......"
echo "Digite o nome do usuario"
read USER
echo "digite a senha do usuario"
read PASS
echo "Cadastrando Usuario $USER......"
echo "Aguarde....."
useradd -m -s /bin/bash -p $(mkpasswd $PASS) $USER
echo $USER "cadastrado com sucesso"
;;
4)
echo "Cadastrando Grupo......"
echo "Digite o nome do grupo"
read GRUPO
echo "Criando o Grupo $GRUPO....."
echo "Aguarde....."
groupadd $GRUPO
echo $GRUPO "cadastrado com sucesso"
;;
5)
echo "Cadastramento de usuario no grupo"
echo "Digite o nome do grupo"
read GRUPO
echo "Digite o nome do usuario que deseja cadastrar no grupo $GRUPO"
read USER
echo "Cadastrando usuario $USER no grupo $GRUPO"
gpasswd -a $USER $GRUPO
echo "Cadastrado com sucesso"
;;
*)
echo "saindo...."
;;
esac
done

