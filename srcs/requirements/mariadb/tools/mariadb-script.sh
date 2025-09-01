#!/bin/sh

if [ ! -d "/var/lib/mysql" ]; then
	mariadb-install-db --basedir=/usr --user=mysqluser --datadir=/var/lib/mysql

	mysqld --user=mysqluser --bootstrap << EOF
		USE mysql;
		FLUSH PRIVLIGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY "DataBasePassword";
		CREATE DATABASE "MyData";
		CREATE USER "MySQLUser"@'%' IDENTIFIED BY "WordPressDBPassword";
		GRANT ALL PRIVLEGES ON "MyData".* TO '"MySQLUser"'@'%';
		FLUSH PRIVLEGES;
		EOF
fi

exec mysqld --defaults-file=/etc/my.cnf.d/mariadb_config