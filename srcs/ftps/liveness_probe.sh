#!/bin/bash

lcountvsftpd=$(ps | grep "vsftpd" | grep -v grep | wc -l)

if [ $lcountvsftpd = 0 ]
then
	return 1
else
	return 0
fi
