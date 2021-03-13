FROM		alpine:latest

MAINTAINER	lmalki-h@student.42.fr

RUN		apk update && \
		apk add mariadb && \
		apk add mariadb-client && \
		apk add openrc && \
		apk add bash

RUN		sed -i 's/^skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf

RUN		openrc && \
		touch /run/openrc/softlevel

COPY		wordpress.sql /wordpress.sql
COPY		setup.sh /setup.sh
COPY		liveness_probe.sh /liveness_probe.sh

EXPOSE		3306

CMD		sh /setup.sh
