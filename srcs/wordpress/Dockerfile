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
		apk add openssl && \
		apk add nginx && mkdir -p /var/run/nginx && \
		apk add bash

COPY		setup.sh /setup.sh
COPY		liveness_probe.sh /liveness_probe.sh
COPY		nginx.conf /etc/nginx/nginx.conf

RUN		mkdir -p /etc/nginx/ssl && \
		openssl req -x509 -nodes -days 365 -newkey rsa:4096 -sha256 \
		-keyout /etc/nginx/ssl/localhost_key.pem \
		-out /etc/nginx/ssl/localhost.pem -subj "/C=FR/ST=IDF/L=P/O=42/OU=lmalki-h/"

RUN		adduser -D -g 'www' www && \
		mkdir -p /www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www

RUN		wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /tmp/

RUN		mkdir -p /var/www/ && \
		tar -xvf /tmp/latest-fr_FR.tar.gz -C /var/www

EXPOSE		5050

CMD		sh /setup.sh	
