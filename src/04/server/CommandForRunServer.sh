#!/bin/bash
gcc main.c -lfcgi -o server
spawn-fcgi -p 8080 ./server
nginx -s reload
nginx -g "daemon off;"