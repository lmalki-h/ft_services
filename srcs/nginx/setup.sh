echo -e "$SSHPASSWORD\n$SSHPASSWORD" | adduser "$SSHUSER"
sed -i "s/CLUSTERIP/$CLUSTERIP/g" /etc/nginx/nginx.conf
/usr/sbin/sshd &
/usr/sbin/nginx -g 'daemon off;' &
tail -f /dev/null 
