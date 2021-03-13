FROM		alpine:latest

MAINTAINER	lmalki-h@student.42.fr

RUN		apk update && \
		apk add wget && \
		apk add php && \
		apk add php-fpm && \
		apk add php-session && \
		apk add php-mysqli && \
		apk add php-gettext && \
		apk add php-json && \
		apk add php-mbstring && \
		apk add php-iconv && \
		apk add nginx && mkdir -p /var/run/nginx && \
		apk add openssl && \
		apk add bash

COPY		nginx.conf /etc/nginx/nginx.conf
COPY		setup.sh /setup.sh
COPY		liveness_probe.sh /liveness_probe.sh

RUN             mkdir -p /etc/nginx/ssl && \
                openssl req -x509 -nodes -days 365 -newkey rsa:4096 -sha256 \
                -keyout /etc/nginx/ssl/localhost_key.pem \
                -out /etc/nginx/ssl/localhost.pem -subj "/C=FR/ST=IDF/L=P/O=42/OU=lmalki-h/"

RUN		adduser -D -g 'www' www && \
		mkdir -p /www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www

RUN		mkdir -p /var/www/phpmyadmin && \
		chmod -R 755 /var/www/*

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz -P /tmp/ && \
		tar xzf /tmp/phpMyAdmin-4.9.5-all-languages.tar.gz --strip-components=1 -C /var/www/phpmyadmin && \
		rm /tmp/phpMyAdmin-4.9.5-all-languages.tar.gz

COPY		config.inc.php /var/www/phpmyadmin/config.inc.php

EXPOSE		5000

CMD		sh /setup.sh
