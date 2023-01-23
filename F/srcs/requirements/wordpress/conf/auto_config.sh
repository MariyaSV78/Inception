#!/bin/bash

#while ! mariadb -h mariadb -u${MDB_USER} -p${MDB_PASS} ${MDB_DATABASE} &>/dev/null; do
	sleep 10
#done

mkdir -p /var/www/html
chmod 777 /var/www/html
chown -R www-data:www-data /var/www/html/
cd /var/www/html

#wp core download --allow-root --locale=fr_FR

if [ ! -f "/var/www/html/wp-config.php" ]; then

#	echo "wp-config.php found"
#else
#	wp core download --allow-root --locale=fr_FR
#	wp config create	--allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD \
#   					--dbhost=mariadb:3306 --path='/var/www/wordpress'

#sleep 2
#wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
#wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
	
wp config create --allow-root --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=mariadb:3306 --path=${PATH}
fi
wp core install --allow-root --url=${DOMAIN_NAME} --title=${SITE_TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL}
wp user create --allow-root ${USER1_LOGIN} ${USER1_MAIL} --role=author --user_pass=${USER1_PASS}
wp theme install twentyseventeen --activate --allow-root
#wp them update twentyseventeen --allow-root
	
wp cache flush --allow-root


mkdir /run/php

exec /usr/sbin/php-fpm7.3 -F -R
