if [ ! -d /var/lib/mysql/wordpress ]; then
	/etc/init.d/mariadb setup
	/etc/init.d/mariadb start
	echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root
	echo "CREATE USER $SQLUSER IDENTIFIED BY '$SQLPASSWORD';" | mysql -u root
	echo "GRANT ALL PRIVILEGES on wordpress.* TO $SQLUSER;" | mysql -u root
	echo "FLUSH PRIVILEGES" | mysql -u root
	sed -i "s/WORDPRESSIP/$WORDPRESSIP/g" wordpress.sql
	mysql -h localhost wordpress < wordpress.sql
else
	/etc/init.d/mariadb start
fi
tail -f /dev/null
