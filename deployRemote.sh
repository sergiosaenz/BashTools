#!/bin/bash
#
#Carga de la configuración la información de despliegue:
#	- Máquina remota.
#	- Usuario.
#	- Contraseña.
#	- Ruta interna dentro de la máquina remota.
#	- Nombre del servidor.
#
#Copia la instancia en la máquina remota en el directorio del servidor.
#
#

main () {


	if [ "$#" -lt 1 ]
	then
		showUsage;
		exit;
	fi
	
	server=$(echo "$1" | cut -d "/" -f1)

	source ${0%/*}'/'deployConfig;
	i=0;
	
	for ser in "${servers[@]}"
	do
		if [ "$server" == "$ser" ]
		then
			echo "Desplegando ${1##*/} en servidor $server"
			dir=${1#*/}
			dir=${dir%/*}
			sshpass -p ${passwords[i]} ssh ${users[i]}@${hosts[i]} "mkdir -p ${paths[i]}/$dir";
			sshpass -p ${passwords[i]} scp $1 ${users[i]}@${hosts[i]}:${paths[i]}/${1#*/}
			echo "DONE"
		fi
		i=$(($i+1))
	done
	
	exit 0;
}

function showUsage {
	echo "./deployRemote.sh <path>"
}

main $@;

