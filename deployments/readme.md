# Deploy tools

Dos script para el despliegue de aplicaciones en servidores remotos.

El script <strong>deployRemote.sh</strong> copia los ficheros a una máquina remota.
Se configura para poder desplegar diferentes aplicaciones en función del nombre. 
Cada una a su host, en un path y con unas credenciales.
Se configuran 5 arrays de variables que se definen el el fichero deployCofnig:
<strong>host:</strong> Es una lista de ip de servidores donde desplegar
<strong>paths:</strong> Una lista de rutas donde desplegar dentro de la máquina remota.
<strong>users:</strong> Lista de nombres de usuarios para la conexión ssh.
<strong>passwords:</strong> Lista de contraseñas para la conexión ssh.
<strong>servers:</strong> Lista de rutas donde se dejarán las aplicaciones para ser desplegadas.


El script <strong>deployLocal.sh</strong> copia los ficheros dejados en un directorio en la ruta especificada.
Se configuran dos variables.
<strong>srcPath</strong> es la ruta donde se dejan los ficheros a copiar.
<strong>rootParh</strong> es la ruta donde se copiarán los ficheros.

