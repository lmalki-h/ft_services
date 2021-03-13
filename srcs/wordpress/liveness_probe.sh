#/bin/bash

lcountphp=$(ps | grep "php" | grep -v grep | wc -l)
lcountnginx=$(ps | grep "nginx" | grep -v grep | wc -l)

if [ $lcountphp = 0] || [ $lcountnginx = 0 ]
then
  return 1
else
  return 0
fi
