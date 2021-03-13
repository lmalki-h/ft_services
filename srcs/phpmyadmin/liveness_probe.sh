#!/bin/bash

lcountnginx=$(ps | grep "nginx" | grep -v grep | wc -l)
lcountphp=$(ps | grep "php" | grep -v grep | wc -l)

if [ $lcountnginx = 0 ] || [ $lcountphp = 0 ]
then
	return 1
else
	return 0
fi
