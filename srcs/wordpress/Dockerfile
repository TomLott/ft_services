FROM alpine:3.12.3

RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add nginx wget supervisor openrc

RUN adduser -D -g 'www' www
RUN rc-update add php-fpm7 default

RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN rm -rf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/run/php
RUN touch /var/run/nginx/nginx.pid

#COPY start.sh /
#RUN chmod 755 /start.sh

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY wp-config.php /var/www/wordpress/wp-config.php

RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf
#t [LABEL]
# Переход по метке LABEL. В том случае, если последняя команда s успешно завершилась (произвела замену). При этом, если LABEL опущена, команда прерывает цикл, и начинает следующий. Если прошлая команда s не произвела замены, команда ничего не делает.
RUN sed -i 's/;    extension=mysql.so/extension=mysql.so/g'  /etc/php7/php.ini
#sed to remove the semicolon (which denotes a comment) from the php config file, thus allowing php to work with mysql.

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz -C /var/www/ && rm -f latest.tar.gz

EXPOSE 5050

CMD ["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]