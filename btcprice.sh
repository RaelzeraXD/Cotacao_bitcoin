#!/bin/bash
#
#Author: israel silva de freitas
#------------------------------
#          CHANGELOG
# v1.0 12/08/2023
#   -basic script but working very well
# v1.1 16/08/2023
#   -verifying if lyns is installed
#------------------------------

[ ! -x "$(which lynx)" ] && echo "Precisamos instalar o lynx, insira sua senha" && sudo apt install lynx 1> /dev/null 2>&1 -y # verifying if lyns is installed

api=https://www.mercadobitcoin.net/api/BTC/ticker/
preco=$(lynx -source $api | cut -d, -f4 | cut -d\" -f4) # pegando o preco medio
timestamp=$(lynx -source $api | cut -d, -f8 | cut -d: -f2 | cut -d} -f1) # filtrando a api para pegar o timestamp
data=$(date -d @$timestamp +'%d/%m/%Y às %H:%M:%S') # converter timestamp em formato legivel
echo "O preço medio vendido do bitcoin em $data é $preco reais"