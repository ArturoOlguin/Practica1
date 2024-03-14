#! /bin/bash

#Problema1

tail -n 15 /var/log/syslog | sort -r > syslog.txt 2>/dev/null
#Tail indica la cola -n delimita las lineas deseadas
# | hace que la salida sea la nueva entrada
# sort ordena 

# Problema 2
# Formato para una operacion aritmetica
# $((expresion))
a=10
echo "$a"
b=$((2*10))
echo "$b"
c=$(((a+b)/2))
echo "$c"
d=$(((2+3)*10))
echo "$d"
#bc -> Usamos un comando externo que nos permite imprimir decimales
div=$(echo "scale=2; $c /2" | bc)
echo "$div"
res=$((b%c))
echo "$res"
