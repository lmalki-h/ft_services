#bin/sh

lcountnginx=$(ps | grep "nginx" | grep -v grep | wc -l)
lcountsshd=$(ps | grep "sshd" | grep -v grep | wc -l)

if [ $lcountnginx = 0 ] || [ $lcountsshd = 0 ]
then
   return 1
else
   return 0
fi
