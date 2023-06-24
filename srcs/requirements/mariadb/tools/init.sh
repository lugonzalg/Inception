#!/bin/sh

mariadb-install-db --user=mysql --verbose --ldata=/var/lib/mysql

exec mysqld_safe --user=mysql --log-error=/log/mariadb/err.log &

while ! mysqladmin ping >/dev/null 2>&1; do
	sleep 1
done

if [ ! -f /log/mariadb ]; then
	mkdir -p /log/mariadb
fi

chown -R mysql:mysql /log/mariadb

mysql -u root -pmyadmin_password <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';
    FLUSH PRIVILEGES;
EOSQL

exec /usr/bin/mysqld --user=mysql --log-error=/log/mariadb/err.log --console --skip-name-resolve --skip-networking=0 $@
