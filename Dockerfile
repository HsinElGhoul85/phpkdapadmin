FROM nginx:1.16

RUN useradd -u 5000 app \
 && mkdir -p /var/run/nginx /var/tmp/nginx \
 && chown -R app:app /usr/share/nginx /var/run/nginx /var/tmp/nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
USER root
RUN apt-get update -y
RUN apt-get install php php-common php-dev libmcrypt-dev php-pear php-fpm php-cgi -y
USER app:app