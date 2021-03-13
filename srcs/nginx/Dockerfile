FROM		alpine:latest

MAINTAINER	lmalki-h@student.42.fr

RUN		apk update && \
		apk add nginx && mkdir -p /var/run/nginx && \
		apk add openssl && \
		apk add openssh && \
		apk add bash

COPY		liveness_probe.sh /liveness_probe.sh
COPY		nginx.conf /etc/nginx/nginx.conf
COPY		id_rsa /etc/ssh/ssh_host_rsa_key
COPY		sshd_config /etc/ssh/sshd_config
COPY		setup.sh /setup.sh
COPY		index.html /www/index.html

RUN		mkdir -p /etc/nginx/ssl && \
		openssl req -x509 -nodes -days 365 -newkey rsa:4096 -sha256 \
		-keyout /etc/nginx/ssl/localhost_key.pem \
		-out /etc/nginx/ssl/localhost.pem -subj "/C=FR/ST=IDF/L=P/O=42/OU=lmalki-h/"
	
RUN		adduser -D -g 'www' www && \
		mkdir -p /www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www

RUN		chmod 400 /etc/ssh/ssh_host_rsa_key

EXPOSE		22 80 443
CMD		sh /setup.sh
