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

[ ! -x "$(which lynx)" ] && echo "we need to install lynx, please insert the password" && sudo apt install lynx -y 1>/dev/null 2>&1 # verifying if lyns is installed

api=https://www.mercadobitcoin.net/api/BTC/ticker/
high=$(lynx -source $api | cut -d, -f1 | cut -d\" -f6 | cut -d. -f1)
low=$(lynx -source $api | cut -d, -f2 | cut -d\" -f4 | cut -d. -f1)
price=$(( ($high + $low) / 2 ))                                          # taking the average price
timestamp=$(lynx -source $api | cut -d, -f8 | cut -d: -f2 | cut -d} -f1) # filtering the api to get the timestamp
date=$(date -d @$timestamp +'%m/%d/%Y at %H:%M:%S')                      # convert timestamp to readable format
echo "the average price in $date is $price BRL"