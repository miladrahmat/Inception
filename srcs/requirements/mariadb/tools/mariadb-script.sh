#!/bin/bash

root_pw=$(cat /run/secrets/db_root_password)
user_pw=$(cat /run/secrets/db_password)

if [ ! -d "/var/lib/mariadb/mysql" ]; then
	mariadb-install-db --user=mariadb --basedir=/usr --datadir=/var/lib/mariadb

	mysqld --user=mariadb --bootstrap <<- EOF
		USE mysql;
		FLUSH PRIVILEGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$root_pw';
		CREATE DATABASE IF NOT EXISTS $DB_NAME;
		CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$user_pw';
		CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$user_pw';
		GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
		GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
		FLUSH PRIVILEGES;
	EOF
fi

exec mysqld --user=mariadb
