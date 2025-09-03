#!/bin/sh

# if [ ! -d "/var/lib/mysql" ]; then
	mariadb-install-db --user=mariadb --basedir=/usr --datadir=/var/lib/mariadb
# fi
root_pw=$(cat /run/secrets/db_root_password.txt)
user_pw=$(cat /run/secrets/db_password.txt)
mysqld --user=mariadb --bootstrap << EOF
	USE mysql;
	FLUSH PRIVLIGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$root_pw';
	CREATE DATABASE $DB_NAME;
	CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$user_pw';
	GRANT ALL PRIVLEGES ON $DB_NAME.* TO '$DB_USER'@'%';
	FLUSH PRIVLEGES;
EOF

exec mysqld --user=mariadb
