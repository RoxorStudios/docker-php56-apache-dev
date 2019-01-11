# docker-php56-apache-dev

## Build
docker build -t roxorstudios/docker-php56-apache-dev:1.0 .

## Create container
docker run -p 80 --name mecanicimport -v ~/project:/var/www/html -d roxorstudios/docker-php56-apache-dev:latest
