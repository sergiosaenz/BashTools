# Deploy tools

Dos script para el despliegue de aplicaciones en servidores remotos.

El script <strong>deployRemote.sh</strong> copia los ficheros a una máquina remota.<br/>
Se configura para poder desplegar diferentes aplicaciones en función del nombre. <br/>
Cada una a su host, en un path y con unas credenciales.<br/>
Se configuran 5 arrays de variables que se definen el el fichero deployCofnig:<br/>
<strong>host:</strong> Es una lista de ip de servidores donde desplegar<br/>
<strong>paths:</strong> Una lista de rutas donde desplegar dentro de la máquina remota.<br/>
<strong>users:</strong> Lista de nombres de usuarios para la conexión ssh.<br/>
<strong>passwords:</strong> Lista de contraseñas para la conexión ssh.<br/>
<strong>servers:</strong> Lista de rutas donde se dejarán las aplicaciones para ser desplegadas.<br/>


El script <strong>deployLocal.sh</strong> copia los ficheros dejados en un directorio en la ruta especificada.<br/>
Se configuran dos variables.<br/>
<strong>srcPath</strong> es la ruta donde se dejan los ficheros a copiar.<br/>
<strong>rootParh</strong> es la ruta donde se copiarán los ficheros.<br/>

