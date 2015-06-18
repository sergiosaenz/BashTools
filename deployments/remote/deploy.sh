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


	if [ "$#" -lt 2 ]
	then
		showUsage;
		exit;
	fi

	source ${0%/*}'/'deploy.conf;

	server=${1#$rootPath};
	server=$(echo "$server" | cut -d "/" -f2)
	i=0;
	
	for ser in "${servers[@]}"
	do
		if [ "$server" == "$ser" ]
		then
			echo "Desplegando ${1##*/} en servidor $server"
			dir=${1#$rootPath/$server}
			sshpass -p ${passwords[i]} ssh ${users[i]}@${hosts[i]} "mkdir -p ${paths[i]}$dir";
			sshpass -p ${passwords[i]} scp $2 ${users[i]}@${hosts[i]}:${paths[i]}/$2;
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

