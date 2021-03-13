#!bin/bash

lcountmysqld=$(ps | grep "mysqld" | grep -v grep | wc -l)

if [ $lcountmysqld = 0 ]
then
	return 1
else
	return 0
fi
