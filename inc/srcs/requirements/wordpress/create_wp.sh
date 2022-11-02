#!/bin/bash

wp core download --allow-root --path=/var/www/

wp config create --skip-check --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbhost=$DB_HOST --dbpass=$DB_USER_PASS --path=/var/www

wp core install --allow-root --url=$DOMAIN_NAME --title=inception --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=$WORDPRESS_ADMIN_EMAIL --path=/var/www

wp user create --allow-root $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASS --path=/var/www

exec "$@"