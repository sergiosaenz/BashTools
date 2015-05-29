#!/bin/bash

path="/home/ssaenz/bitacora/";

main () {

	if [ "$#" -eq 0 ]
		then
			showUsage;
			exit;
	fi
	
	if [ "$1" == "-s" ]; then
		if [ ! -d $path ]; then
			mkdir -p $path;
		fi
		filename=$(date +%d-%m-%Y);
		file="$path$filename";
		if [ ! -f file ]; then
			touch $file;
		fi
		echo "$(date +%02H:%02M:%02S) $2" >> "$file";
			exit;
	fi
	
}

function showUsage {
	echo "------------bitacora---------------"
	echo " Comando para registrar tareas realizadas en un determinado momento."
	echo " Crea un fichero nombrado con la fecha de hoy y en el contenido pone una línea con el texto pasado por parámetro y la hora a la que se invocó al script."
	echo "Para usarlo:"
	echo "bitacora -s [texto]"
	echo "Para configurarlo: editar la variable [path] definida al principio del script"
}

main "$@";

