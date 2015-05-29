#!/bin/bash

main () {

	if [ "$#" -eq 0 ]
		then
			showUsage;
			exit;
	fi
	
	if [ "$1" == "generate" ]; then
		if [ -z $2 ]; then
			showUsage;
			exit;
		fi
		
		PATH=$3
		
		if [ "$2" == "script" ]; then
			if [ -z $3 ]; then
				echo "empty name supplied, the script will be created with name 'script.sh' in";
				pwd
				PATH=script.sh;
			fi
			printScriptTemplate > $PATH;
			exit;
		fi
		
		if [ "$2" == "project" ]; then
			echo ".... comming soon. Not yet implemented"
			exit;
		fi
	fi
}

function showUsage {
		echo "-----------------Util ----------------------";
		echo "La caja de herramientas. Script pensado para aglutinar diversas funcionalidades."
		echo ""
		echo "Utilidades:" 
		echo ""
		echo "[generate]"
		echo "Pensado para generar scripts, proyectos y plantillas varias."
		echo ""
		echo "Atributos:"
		echo "[script][nombre]		Genera una plantilla de nombre dado con el contenido inicial básico de un script bash."
		echo "";
		echo "Usage:   util [command] [option]";
		echo "";
		echo "Commands:";
		echo "";
		echo "  generate:			generate different files or directories:";
		echo "    Options:";
		echo "        script	[path]		Generate and empty script.sh with basics in the given directory";
		echo "        project	[name]		Generate a directory with a new eclipse and several util subdirectories";
}

function printScriptTemplate {
	echo "#!/bin/bash"
	echo ""
	echo "main () {"
	echo ""
	echo "	if [ \"\$#\" -eq 0 ]"
	echo "		then"
	echo "			showUsage;"
	echo "			exit;"
	echo "	fi"
	echo "}"
	echo ""
	echo "function showUsage {"
	echo "	echo \"Your script usage description\""
	echo "}"
	echo ""
	echo "main \$@;"
	echo ""
}

main $@
