FROM alpine:3.7

RUN apk add nginx openssl openrc sudo supervisor openssh bash
RUN mkdir -p /run/nginx
RUN mkdir /var/run/sshd
RUN rm -rf /etc/nginx/conf.d/default.conf

COPY index.html /var/www/
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf
#COPY start.sh /

#RUN chmod -R 777 ./start.sh


RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out nginx.crt \
    -keyout nginx.key \
    -subj "/C=RU/ST=-/L=-/O=-/OU=-/CN=ft_services"

#RUN ssh-keygen -A && adduser -D ssh_admin && echo "ssh_admin:1111" | chpasswd

RUN adduser -D itollett && echo "itollett:root" | chpasswd && addgroup itollett wheel \
&& echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel && /usr/bin/ssh-keygen -A

EXPOSE 80 443 22

CMD ["usr/bin/supervisord", "-c", "etc/supervisord.conf"]
