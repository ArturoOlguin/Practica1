#!/bin/bash
function problema1(){
  tail -n 15 /var/log/syslog | sort -r > syslog.txt 2>/dev/null
  echo "Archivo de salida creado: syslog.txt"
  read -p "Presione Enter para continuar..."
}
function problema2(){
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
}
function problema3(){
  # Verificar si se proporcionaron 3 argumentos
  if [ $# -ne 3 ]; then
    echo "Usage: $0 <file1> <file2> <file3>"
    exit 1
  fi

  file1=$1
  file2=$2
  file3=$3

  # Validar el primer archivo
  if [ -r "$file1" ]; then
    echo "$file1 Tiene permisos de lectura."
    elif [! -r $file1]; then
    	echo "$file1 NO tiene permisos de lectura"
  fi

  # Validar el segundo archivo
  if [ ! -e "$file2" ]; then
    echo "$file2 no existe."
  elif [ ! -x "$file2" ]; then
    echo "$file2 no tiene permisos de ejecución."
  fi

  # Mostrar el propietario del tercer archivo
  if [ -f "$file3" ]; then
    echo "El propietario de $file3 es $(stat -c '%U' "$file3")."
  else
    echo "$file3 no es un archivo válido."
  fi

  # Mostrar el archivo más antiguo
  oldest=$(stat -c '%Y' "$file1")
  oldest_file="$file1"

  if [ $(stat -c '%Y' "$file2") -lt $oldest ]; then
    oldest=$(stat -c '%Y' "$file2")
    oldest_file="$file2"
  fi

  if [ $(stat -c '%Y' "$file3") -lt $oldest ]; then
    oldest=$(stat -c '%Y' "$file3")
    oldest_file="$file3"
  fi

  echo "El archivo más antiguo es $oldest_file."
}

function problema4(){
# Si HOSTNAME es una variable vacía o
# verificamos todas las variables
	env
# tiene el valor "(none)"; entonces ...
if [ -z "$HOSTNAME" ] || [ "$HOSTNAME" = "(none)" ]; then
  echo "HOSTNAME es una variable vacía o tiene el valor '(none)'."
fi
}

function problema5(){
    # Verificar si hay argumentos
    if [ $# -eq 0 ]; then
        echo "Sin argumentos"
    else
        # Imprimir el número de argumentos
        echo "Número de argumentos: $#"

        # Iterar a través de los argumentos y mostrar su valor $#
        echo "Valores de los argumentos:"
        for arg in "$@"; do
            echo "$arg"
        done
    fi
}

function problema6(){
if [ $# -eq 0 ]; then
  echo "No ingreso argumentos"
  exit 2
elif [ $# -gt 2 ]; then
  echo "Ah ingresado mas de 2 argumentos, UNICAMENTE se requieren 2 [archivo] [ruta]"
elif [ -e "$1" ] && [ -d "$2" ]; then
  echo "Ambos argumentos existen"
  cp $1 $2
else
  echo "Revise que ambos argumentos existan. Nota los argumentos van en orden [archivo] [ruta]"
fi
}

while true; do
    clear
    echo "Menú de selección de problemas:"
    echo "1. Problema 1"
    echo "2. Problema 2"
    echo "3. Problema 3"
    echo "4. Problema 4"
    echo "5. Problema 5"
    echo "6. Problema 6"
    echo "0. Salir"

    read -p "Seleccione un problema (0-6): " opcion

    case $opcion in
        0)
            echo "Saliendo..."
            break
            ;;
        1)
            echo "Seleccionado: Problema 1"
            problema1
            read -p "Presione Enter para continuar..."
            ;;
        2)
            echo "Seleccionado: Problema 2"
            problema2
            read -p "Presione Enter para continuar..."
            ;;
        3)
            echo "Seleccionado: Problema 3"
            read -p "Ingresa el archivo 1 :" archivo
            read -p "Ingresa el archivo 2 :" archivo2
            read -p "Ingresa el archivo 3 :" archivo3
            problema3 "$archivo" "$archivo2" "$archivo3"
            read -p "Presione Enter para continuar..."
            ;;
        4)
            echo "Seleccionado: Problema 4"
            problema4
            read -p "Presione Enter para continuar..."
            ;;
        5)
            echo "Seleccionado: Problema 5"
	    echo "Ingrese los argumentos: "
	    read -a args
	    problema5 "${args[@]}"
	    read -p "Presione Enter para continuar..."
	    ;;

        6)
            echo "Seleccionado: Problema 6"
            # Inserta aquí el código del Problema 6
            read -p "Ingresa el nombre del archivo: " archivo
            read -p "Ingresa la ruta (directorio): " directorio
            problema6 "$archivo" "$directorio"
            read -p "Presione Enter para continuar..."
            ;;
        *)
            echo "Opción inválida. Por favor, seleccione una opción válida (0-6)."
            read -p "Presione Enter para continuar..."
            ;;
    esac
done


--Modificar los input por argumentos
