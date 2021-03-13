mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
sed -i "s/votre_nom_de_bdd/wordpress/" /var/www/wordpress/wp-config.php
sed -i "s/votre_utilisateur_de_bdd/$SQLUSER/" /var/www/wordpress/wp-config.php
sed -i "s/votre_mdp_de_bdd/$SQLPASSWORD/" /var/www/wordpress/wp-config.php
sed -i "s/localhost/$MYSQL_IP/" /var/www/wordpress/wp-config.php
/usr/sbin/nginx -g 'daemon off;' &
php -S 0.0.0.0:5050 -t /var/www/wordpress
