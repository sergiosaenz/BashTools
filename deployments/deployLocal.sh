#!/bin/bash

main () {

	if [ "$#" -eq 0 ]
		then
			showUsage;
			exit;
	fi
}

function showUsage {
	echo "Your script usage description"
}

main $@;

