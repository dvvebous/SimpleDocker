FROM nginx

WORKDIR /usr/src/server

COPY ./server /usr/src/server
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev nginx; \
    chmod +x CommandForRunServer.sh

CMD bash CommandForRunServer.sh

