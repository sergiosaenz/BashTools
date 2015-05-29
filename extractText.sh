#!/bin/bash

TOKEN_START="TOKEN_START";
TOKEN_END="TOKEN_END";

main () {

	if [ "$#" -lt 2 ]
		then
			showUsage;
			exit;
	fi
	extract $@;
}

function showUsage {
	echo "----------------------Extract text----------------------"
	echo "Extrae el texto entre dos patrones a un fichero dado"
	echo "extractText.sh [origen] [destino]"
	echo "Para configurarlo: Cambiar las variables TOKEN_START y TOKEN_END definidas al principio del script."
}

function extract () {
	echo "starting";
	sed -n '/'$TOKEN_START'/{:a;n;/'$TOKEN_END'/b;p;ba}' $1 >> $2
	echo "done"
}

main $@;

