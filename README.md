<p align="center">
    <a href="https://www.docker.com/" target="_blank">
        <img src="https://www.docker.com/sites/default/files/mono_vertical_large.png" height="100px">
    </a>
    <h1 align="center">Docker-compose de Yii2 AppAdvanced </h1>
    <br>
</p>


Este repositorio es un clonado del oficial. Puede encontrarlo en: [DockerHub](https://hub.docker.com/r/yiisoftware/yii2-php/). 
## Información

Está listo para volcar un proyecto de yii2 advanced dentro de la carpeta _host_volumes/app. 
Utiliza los puertos 8000 y 8001 (frontend y backend respectivamente).

El docker-compose está preparado para utilizar MySQL y las variables de entorno se definieron tanto en el Dockerfile de Debian como en .env

Como el repo oficial se puede elegir utilizar el Dockerfile de Alpine o Debian. También puede elegir Nginx como alternativa a Apache2 sin embargo aún no fue testeado sobre con estas configuraciones.


### Instalación


Clonar el repositorio de git y modificar el archivo "punto.env" a gusto. Renombrar el archivo a ".env"

Construir la imagen
```
 docker-compose build
```

Levantar el contenedor en modo daemon
```
 docker-compose up -d
```

Ingresar al docker para instalar un aplicación yii. 
(Luego se guarda en _host-volumes/app por defecto)
Nombre de contenedor por defecto: php
```
 docker exec -ti php bash 
```

Dentro del contenedor:
```
-> composer create-project yiisoft/yii2-app-advanced /app
-> cd /app
-> php init (configurar yii)
```
Puertos utilizados por defecto: 
```
Frontend: 8000
Backend: 8001

```
Configuración de apache:
en la carpeta del proyecto docker php/image-files/etc/apache2/
Para definir puertos archivo : ports.conf
Para definir configuraciones de apache: apache2.conf
Para definir VH: sites-available

Cada vez que se modifique un archivo relacionado a la imagen:
docker-compose build

El repo de la imagen recomienda crear un .htaccess en la carpeta web (front y back)
Es el siguiente:

RewriteEngine on
# If a directory or a file exists, use it directly
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
# Otherwise forward it to index.php
RewriteRule . index.php

```
7.2-apache, 7.1-apache, 7.0-apache, 5.6-apache
7.2-fpm, 7.1-fpm, 7.0-fpm, 5.6-fpm
```

