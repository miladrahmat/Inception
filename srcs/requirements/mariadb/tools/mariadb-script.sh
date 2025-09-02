#!/bin/sh

# if [ ! -d "/var/lib/mysql" ]; then
	mariadb-install-db --basedir=/usr --user=mysql --datadir=/var/lib/mysql
# fi
echo "HERE"
mysqld --user=mysql --bootstrap << EOF
	USE mysql;
	FLUSH PRIVLIGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY "DataBasePassword";
	CREATE DATABASE MyData;
	CREATE USER "user"@'%' IDENTIFIED BY "WordPressDBPassword";
	GRANT ALL PRIVLEGES ON MyData.* TO '"user"'@'%';
	FLUSH PRIVLEGES;
EOF

exec mysqld --user=mysql
