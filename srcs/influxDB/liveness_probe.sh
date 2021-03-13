#!bin/bash

lcountinfluxdb=$(ps | grep "influxd" | grep -v grep | wc -l)

if [ $lcountinfluxdb = 0 ]
then
	return 1
else
	return 0
fi
