#!/bin/bash


#SCRIT GIT 


menu(){

echo '----------------------------------------------'
echo '                    MENU                      '
echo '----------------------------------------------'
echo 
echo "Escolha uma opção"
echo
echo "1 Instalar o GitHub"
echo "2 Configuraro o GitHub" 
echo "3-Configurar um novo repositorio"
echo "4-Adicionar um novo arquivo"
echo "5-Atualizar um arquivo"
echo "6-Romover um arquivo"
echo "7-Listar aquivos disponiveis"
echo "8-Sair"
echo
echo -n "Digite a opção desejada:"
read opcao

case $opcao in

1) install_git;;
2) config_git;;
3) new_repository ;;
4) new_file ;;
5) update_file ;;
6) remove_file ;;
7) list_files ;;
8) exit ;;
*) 'Opção invalida.' ; echo; menu;;


esac 
}

install_git(){

sudo apt-get install git

menu
}

config_git(){

echo "Digite o nome do usuário git: Ex.: paulotc29"
read nome
echo
#echo "O nome $nome está correto?"
#read
#echo
sudo git config --global user.name $nome
echo
echo "Digite o email do git: Ex.: paulotc29@gmail.com"
read email
#echo "O email $email está correto?"
#read
#echo
sudo git config --global user.email $email 
echo 
echo "Configuração realizada com sucesso!"

menu
}

## criar repositorio
new_repository(){
echo 
echo "Crie um diretorio na plataforma git, antes de continuar"
read link

echo "# Zabbix" >> README.md

echo "Digite o link do diretorio:"
read link

echo "O link $link está correto?"
read 

git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin $link
sudo git push -f origin main

menu
}

## criar arquivo
new_file(){
echo 
echo "Digite o nome do aquivo para backup:"
read arquivo
git add $arquivo
echo 
echo "Digite uma mensagem de uptate:"
read update 
echo

git commit -m '$update'
git branch -M main
sudo git push -f origin main

menu
}

## atualizar aquivo
update_file(){

echo 
echo "Digite o nome do aquivo para backup:"
read arquivo
git add $arquivo
echo 
echo "Digite uma mensagem de uptate:"
read update 
echo

git commit -m '$update'

git push -f origin master

menu	
}

#remover arquivo

remove_file(){

echo 
echo "Digite o nome do aquivo ser removido:"
read arquivo
git rm $arquivo
echo 
echo "Digite uma mensagem de uptate:"
read update 
echo

git commit -m '$update'

git push -f origin master


menu
}


list_files(){

echo
echo "Segue a lista de arquivos disponíveis no momento:" 
echo
ls -la
echo

menu	
}

exit(){
if [[ exit ]]; then
echo 'Saiu do programa...'
echo
fi
}

menu
