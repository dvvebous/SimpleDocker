#!/bin/bash
gcc main.c -lfcgi -o server
/usr/bin/spawn-fcgi -p 8080 ./server
nginx -g "daemon off;"