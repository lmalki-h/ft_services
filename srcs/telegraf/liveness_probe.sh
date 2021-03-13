#!bin/bash

lcounttelegraf=$(ps | grep "telegraf" | grep -v grep | wc -l)

if [ $lcounttelegraf = 0 ]
then
	return 1
else
	return 0
fi
