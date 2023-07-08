#!/bin/sh

if [ ! -d "/var/lib/mysql/$MYSQL_DB" ] ; then
	mysql_install_db --datadir=/var/lib/mysql --auth-root-authentication-method=normal
	mysqld --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE $MYSQL_DB;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';
ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

fi

echo "MARIADB OK"

exec mysqld --datadir=/var/lib/mysql