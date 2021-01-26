FROM alpine:3.7
USER root
RUN adduser -D -g 'www' www

#RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
#RUN python3 -m ensurepip
#RUN pip3 install --no-cache --upgrade pip setuptools

RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-iconv php7-mysqli php7-mbstring php7-json php7-session
RUN apk add nginx openrc supervisor
#RUN rc-update add php-fpm7 default

RUN mkdir -p /var/www/phpmyadmin

RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /var/run/nginx && mkdir -p var/run/php
RUN touch /var/run/nginx/nginx.pid && rm -rf /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/
COPY config.inc.php /var/www/phpmyadmin

ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz /
RUN tar -xzvf phpMyAdmin-5.0.4-english.tar.gz --strip-components 1 -C /var/www/phpmyadmin
RUN rm -f phpMyAdmin-5.0.4-english.tar.gz

EXPOSE 5000

#COPY start.sh /
#RUN chmod 755 /start.sh

#CMD ["/.start.sh"]
CMD ["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]