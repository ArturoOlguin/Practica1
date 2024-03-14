#! /bin/bash

#Problema1

tail -n 15 /var/log/syslog | sort -r > syslog.txt 2>/dev/null
#Tail indica la cola -n delimita las lineas deseadas
# | hace que la salida sea la nueva entrada
# sort ordena 

# Problema 2
a=10
b=$((2*10))
