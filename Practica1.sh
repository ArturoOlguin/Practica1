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

#Problema 5
if [ $# -eq 0 ]; then
  echo "No hay argumentos"
else
  echo "El numero de argumentos es: "$#
  #$@ -> todos los argumentos pasados al script
  echo "Los argumentos son: "$@
fi
# Problema 6
if [ $# -eq 0 ]; then
  echo "No ingreso argumentos"
  exit 2
elif [ $# -gt 2 ]; then
  echo "UNICAMENTE puede copiarse un elemento a la vez"
elif [ -e "$1" ] && [ -d "$2" ]; then
  echo "Ambos argumentos existen"
  cp $1 $2
else
  echo "Revise que ambos argumentos existan. Nota los argumentos van en orden [archivo] [ruta]"
fi
