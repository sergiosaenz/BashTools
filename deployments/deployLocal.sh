#!/bin/bash

#Recive como parámetro ($1) la ruta del fichero modificado
#	Hacer una copia del fichero anterior en $rootPath$1"_backup"
#	Copiar el fichero en $rootPath$1
#
#
#/home/ssaenz/tools/BashTools/deployments/prueba

srcPath="/opt/deploy";

rootPath="/opt/instances";

main () {

	if [ "$#" -lt 2 ]
		then
			showUsage;
			exit;
	fi

	confFile=${0%/*}'/'deploy.conf;

	
	if [ -f $confFile ]
	then
		source $confFile;
	fi
	
	dir=$rootPath${1#$srcPath};
	backupDir=$rootPath${1#$srcPath}"_backup";
	
	mkdir -p $dir;
	mkdir -p $backupDir;
	
	oldFile=$dir"/"$2;
	file=$1"/"$2;
	
	if [ -f $oldFile ]
	then
		cp $oldFile $backupDir;
	fi
	
	if [ -f $file ]
	then
		cp $file $dir;
	fi
	exit;
}

function showUsage {
	echo "./deployLocal.sh <dirPath> <filename>"
}

main $@;

