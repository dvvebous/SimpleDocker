#!/bin/bash
#Needs to install spawn-fcgi libfcgi-dev nginx docker docker-compose
#Turn on service docker
gcc main.c -lfcgi -o server
sudo spawn-fcgi -p 8080 ./server
cp nginx.conf /usr/share/nginx/nginx.conf
sudo nginx -c nginx.conf
sudo service nginx restart