#!/bin/python3
#
#Author: israel silva de freitas
#------------------------------
#          CHANGELOG
# v1.0 26/09/2023
#   -basic program working good
# v1.1 27/09/2023
#   -returning the values in table
#------------------------------

import requests
import datetime
api = "https://www.mercadobitcoin.net/api/BTC/ticker/"  
r = requests.get(api)

#timestamp to date
timestamp = r.json()['ticker']['date']
humanreadable = datetime.datetime.fromtimestamp(timestamp)
format = "%d/%m/%Y at %H:%M:%S"
date = humanreadable.strftime(format)

for value in r.json()['ticker']:
    if value == "date":
        print("date :",date)
        break
    print(value ,":", r.json()['ticker'][value])