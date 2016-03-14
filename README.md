# docker-oracle-tomcat7

##Archivos para creación de imagen de docker con oracle 11g y tomcat 7

El proyecto sirve para la compilación de una imagen genérica de docker, que contenga un oracle xe 11g, y un tomcat 7 corriendo sobre java 8, para poder desplegar aplicaciones web de forma más sencilla.

También tiene un servidor ssh con usuario **root** y contraseña **admin** para poder realizar cambios sobre el contenedor si son necesarios.


Para la compilación en local, existe un fichero que ayuda a la creacion de la imagen y contenedores llamado **Makefile**. Desde el, podemos realizar las siguientes tareas:

1. Construir la imagen mediante **make build**

2. Arrancar un nuevo contenedor con el comando **make start** con la configuración de las variables de entorno del fichero.

3. Conectarse mediante ssh (Se usa el comando *sshpass* que debe de estar instalado en servidor, para automatizar el proceso) **make ssh** al contenedor lanzado con el nombre de las variables de entorno del fichero.

4. Crear un contenedor de la imagen correspondiente en modo interactivo con el comando **make shell**

5. Detener el contenedor previamente lanzado con la configuración de las variables de entorno del fichero, con el comando **make stopcontainer**

6. Eliminar el contenedor previamente creado con la configuración de las variables de entorno del fichero, con el comando **make rmcontainer**

7. Eliminar la imagen previamente creada con la configuración de las variables de entorno del fichero, con el comando **make rmimage**

8. Lanzar el contenedor parado, que se ha creado anteriormente con la configuración de las variables de entorno del fichero, con el comando **make startcontainer**

9. Lanzar secuencialmente los comandos *stopcontainer*, *rmcontainer* y *rmimage* con el comando **make rmall**

10. Lanzar secuencialmente los comandos *build* y *start* con el comando **make init**


Para más facilidad, se incluye tambien un fichero llamado **iniciar.sh** que directamente construye la imagen, y crea un contenedor con los parametros del *Makefile*, borrando primero los contenedores de este tipo que haya y la imagen existente.


En el directorio filesconfig, se incluye un fichero **tomcat-users.xml** que incluye un usuario para el manager gui de tomcat, con nombre de usuario *admin* y password *admin*.

Además se incluye el driver de *ojdbc* que se se incluye en el directorio de librerias del tomcat al construir la imagen.

