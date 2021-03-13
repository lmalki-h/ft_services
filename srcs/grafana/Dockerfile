FROM		alpine:latest

MAINTAINER	lmalki-h@student.42.fr

RUN		apk update && \
		apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing && \
		apk add bash

COPY		dashboards /dashboards
COPY		default.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY		dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/

WORKDIR		/usr/share/grafana
EXPOSE		3000
CMD		/usr/sbin/grafana-server web --config /etc/grafana.ini
