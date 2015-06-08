#!/bin/bash

TOKEN_START="<patron_inical>";
TOKEN_END="<patron_final>";


main () {
	if [ "$#" -lt 3 ]
		then
			showUsage;
			exit;
	fi
	moveAndExtract $@;
}

function showUsage {
	echo "----------------------Extract text and move last files----------------------"
	echo "Extrae el texto entre dos patrones de los ficheros modificados en un el último periodo de tiempo contenidos en un direcotrio"
	echo "Deja los ficheros generados en el directorio indicado"
	echo "moveAndExtract.sh [origen] [destino] [tiempo]"
	echo "Para configurarlo: Cambiar las variables TOKEN_START y TOKEN_END definidas al principio del script."
}

function moveAndExtract () {

	mkdir -p $2;
	
	
	find $1 -type f -mtime -$3 -printf '%T@ %p\n' | sort -n | cut -f2- -d" " | \
	while read line
	do
		path=$2"/"${line#$1};
		mkdir -p ${path%/*}
		sed -n '/'$TOKEN_START'/{:a;n;/'$TOKEN_END'/b;p;ba}' $line >> $path;
		echo "file "${line#$1}" extracted on "${path%/*}
	done;
}


main $@;

