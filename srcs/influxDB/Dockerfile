FROM		alpine:latest

MAINTAINER	lmalki-h@student.42.fr

RUN		apk update && \
		apk add influxdb && \
		apk add bash

COPY		create_admin /create_admin
COPY		setup.sh /setup.sh
COPY		liveness_probe.sh /liveness_probe.sh

EXPOSE		8086
CMD		sh /setup.sh
