#!/bin/bash

db_user_pw=$(cat /run/secrets/db_password)
wp_user_pw=$(cat /run/secrets/wp_user_password)
wp_admin_pw=$(cat /run/secrets/wp_root_password)

chown -R $WEB_USER:$WEB_GROUP /var/www/html
cd /var/www/html

mysqladmin ping --protocol=tcp --host=mariadb -u $DB_USER --password=$db_user_pw --wait

if [ ! -f wp-config.php ]; then

	wp core download \
		--allow-root \
		--version=6.8.2

	wp config create \
		--allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$db_user_pw \
		--dbhost=mariadb:3306 \
		--path=/var/www/html

	wp core install \
		--allow-root \
		--url=$DOMAIN_NAME \
		--title=$TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$wp_admin_pw \
		--admin_email=$WP_ADMIN_EMAIL \

	wp user create \
		$WP_USER \
		$WP_USER_EMAIL \
		--path=/var/www/html \
		--user_pass=$wp_user_pw
fi

php-fpm83 -F