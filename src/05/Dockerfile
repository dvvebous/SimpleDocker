FROM nginx

WORKDIR /usr/src/server

COPY ./server /usr/src/server
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev nginx \
    && rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /usr/share/nginx/* \
    && chmod -R 0755 /usr/share/nginx/* \
    && touch /var/run/nginx.pid \
    && chown -R nginx:nginx /var/run/nginx.pid \
    && chown -R nginx:nginx . \
    && chown -R nginx:nginx /usr/bin/  \
    && chown -R nginx:nginx /var/cache/nginx \
    && chmod g-s /sbin/unix_chkpwd
USER nginx
HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://localhost || exit 1
ENTRYPOINT sh CommandForRunServer.sh