php -S 0.0.0.0:5000 -t /var/www/phpmyadmin &
/usr/sbin/nginx -g 'daemon off;' &
tail -f /dev/null
