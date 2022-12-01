#!/bin/bash

sleep 5

mkdir -p /var/www/html/wordpress
chmod 777 /var/www/html
chown -R www-data:www-data /var/www/html/
cd /var/www/html/wordpress/

wp core download --allow-root --locale=fr_FR

if [ ! -f /var/www/html/wordpress/wp-config.php ];
then
	wp config create --allow-root --dbname=${MDB_DATABASE} --dbuser=${MDB_ADMIN} --dbpass=${MDB_MDP} --dbhost=${MDB_HOST_PORT} --path=${WP_WEBSITE_PATH}
fi

wp core install --allow-root --url=${WP_DOMAIN_NAME} --title=${WP_WEBSITE_NAME} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_MDP} --admin_email=${WP_ADMIN_MAIL}

wp user create --allow-root ${WP_NUSER} ${WP_NUSER_MAIL} --role=author --user_pass=${WP_NUSER_MDP}

wp theme install twentyseventeen --activate --allow-root
wp cache flush --allow-root

mkdir /run/php

exec /usr/sbin/php-fpm7.3 -F -R
