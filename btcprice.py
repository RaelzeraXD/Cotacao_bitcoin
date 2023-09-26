#!/bin/python3
#
#Author: israel silva de freitas
#------------------------------
#          CHANGELOG
# v1.0 26/09/2023
#   -basic program working good
#------------------------------

import requests
import datetime
api = "https://www.mercadobitcoin.net/api/BTC/ticker/"  
r = requests.get(api)
low = r.json()['ticker']['low']
high = r.json()['ticker']['high']
average =(float(high) + float(low))/2

#timestamp to date
timestamp = r.json()['ticker']['date']
humanreadable = datetime.datetime.fromtimestamp(timestamp)
format = "%d/%m/%Y at %H:%M:%S"
date = humanreadable.strftime(format)


print(f"the average price in {date} is {average} BRL")