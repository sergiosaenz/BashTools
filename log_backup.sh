#!/bin/bash



main () {
	if [ "$#" -lt 2 ]
		then
			showUsage;
			exit;
	fi
	
	rm "$1"/backup.tar.gz 2>&1 /dev/null;
	
	mkdir "$1"/backup;
	
	createBackup $@ 2>&1 /dev/null;cd /et	
	
	cd $1;
	
	tar -zcvf backup.tar.gz backup/;
	
	rm -r backup/
}

function showUsage {
	echo "--------------------log backup----------------------"
	echo "En el directorio dado crea un backup de los ficheros con fecha anterior al número de días dado dentro del mismo directorio"
	echo ""
	echo "    Usage:		log_backup.sh [dir_path] [days]"
	echo ""
}

function createBackup () {
	
	find "$1" -type f -ctime -"$2" -exec mv {} "$1"/backup/ \;
	
}

main $@;

