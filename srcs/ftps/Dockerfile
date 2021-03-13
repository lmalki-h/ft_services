FROM		alpine:latest

MAINTAINER	lmalki-h@student.42.fr

RUN		apk update && \
		apk add vsftpd && \
		apk add openssl && \
		apk add bash

COPY		vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY		setup.sh /setup.sh
COPY		liveness_probe.sh /liveness_probe.sh

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=FR/ST=FR/L=P/O=42/OU=lmalki-h"

EXPOSE		20 21 2100-21010

CMD		sh /setup.sh
