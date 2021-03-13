FROM		alpine:latest

MAINTAINER	lmalki-h@student.42.fr

RUN		apk update && \
		apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --no-cache && \
		apk add bash

COPY		telegraf.conf /etc/telegraf.conf
COPY		liveness_probe.sh /liveness_probe.sh
CMD		/usr/bin/telegraf --config /etc/telegraf.conf
