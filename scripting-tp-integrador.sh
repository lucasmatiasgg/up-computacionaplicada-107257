#!/bin/bash

# Script TP Integrador
# Escribir un script que muestre un menu y haga lo siguiente:
#     1) Pedir un numero entero y mostrar esa cantidad de elementos de la sucesion de Fibonacci.
#     2) Pedir un numero entero y mostrar por pantalla ese numero en forma invertida.
#     3) Pedir una cadena de caracteres y evaluar si es palindromo o no.
#     4) Pedir el path a un archivo de texto y mostrar por pantalla la cantidad de lineas que tiene.
#	  5) Pedir el ingreso de 5 numero enteros y mostrarlos por pantalla en forma ordenada.
#	  6) Pedir el path a un directorio y mostrar por pantalla cuantos archivos de cada tipo contiene.
#     7) Salir (Saludando al usuario que ejecuto el programa).
# Si se presiona otra tecla, mostrar "Opcion incorrecta".



# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Sucesion de Fibonacci según el numero ingresado"
    echo "2) Numero en forma invertida"
    echo "3) Palindromo"
    echo "4) Cantidad de lineas de un archivo"
	echo "5) Ordenar numeros"
	echo "6) Cuantos archivos de cada tipo"
    echo "7) Salir"
    echo "-------------------------------------------------------------"
}

function salir_saludando(){
    NOMBRE=$1 # Guardo el parametro nro. 1 que recibe la function
    echo "Chau $NOMBRE"
    sleep 2
}

function fibonacci(){
	cantidad=$1 #Numero ingreado por teclado
	aux=1
	aux2=1
	echo $aux
	if [ $1 -gt 1 ]
	then
		echo $aux2
	fi
	
	for((i=3;i<=cantidad;i++))
		do	
			val=`expr $aux + $aux2`
			echo $val
			aux=$aux2
			aux2=$val		
		done
}

# ---------------------------- PROGRAMA PRINCIPAL ---------------------------- #
OPCION=0
mostrar_menu

while true; do
    read -p "Ingrese una opcion: " OPCION # Mensaje y read en la misma linea
    case $OPCION in
        1)
			NUM=0
			read -p "Ingrese un numero para ver la serie de Fibonacci: " NUM
			fibonacci $NUM ;;		
		2)
			NUM=0
			read -p "Ingrese un numero entero: " NUM
			echo $NUM | rev ;;
		3)
			read -p "Ingrese una cadena de caracteres: " cadena
			cadenaInvertida=`echo $cadena | rev`
			if [ $cadena = $cadenaInvertida ]
			then
				echo "Es Palindormo"
			else
				echo "NO es Palindormo"
			fi ;;
		4)
			read -p "Ingrese el path del archivo de texto: " path
			if [ -f $path ]
			then
				cantLineas=`cat $path |wc -l`
				echo "Cantidad de lineas que tiene el archivo: $cantLineas"
			else
				echo "El path ingresado no corresponde a un archivo" 
			fi	;;
		5) 
			echo "Ingrese 5 numeros enteros: " 
			for((i=1;i<=5;i++))
				do
					read -p "Numero $i: " numero$i
				done
				
			echo -e "$numero1\n$numero2\n$numero3\n$numero4\n$numero5" | sort -n ;; 
			
		6)
			read -p "Ingrese un directorio: " path
			if [ -d $path ]
			then
				find $path -type f | sed -n 's/..*\.//p'  |sort |uniq -c
			else
				echo "El directorio no existe" 
			fi	;;
						
        7)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
