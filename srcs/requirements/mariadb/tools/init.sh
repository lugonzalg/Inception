#!/bin/sh

#SOURCE -> https://github.com/yobasystems/alpine-mariadb/blob/master/alpine-mariadb-aarch64/files/run.sh

#CHECK if daemon exists
if [ -f /run/mysqld ]; then
	echo "mysqld daemon already exists, setting permissions"
	chown -R mysql:mysql /run/mysqld
else
	echo "mysqld daemon doesn't exist! Creating ..."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

#CHECK if database exists
if [ -d /var/lib/mysql/mysql ]; then
	echo "mysql database already exists, setting permissions"
	chown -R mysql:mysql /var/lib/mysql
else
	echo "mysql database doesn't exist! Creating ..."
	chown -R mysql:mysql /var/lib/mysql

	mariadb-install-db --user=mysql --verbose --ldata=/var/lib/mysql

	tmp_file=mktemp

	cat << EOF > $tmp_file
	CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'$WORDPRESS_HOST' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';
	FLUSH PRIVILEGES;
EOF

	/usr/bin/mysqld --user=mysql --bootstrap --skip-name-resolve --skip-networking=0 < $tfile
	rm -rf $tfile

fi

exec /usr/bin/mysqld --user=mysql --log-error=/log/mariadb/err.log --console --skip-name-resolve --skip-networking=0 $@
