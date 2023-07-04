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
	USE mysql;
	FLUSH PRIVILEGES ;
	GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
	GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
	SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}');
	DROP DATABASE IF EXISTS test ;
	FLUSH PRIVILEGES ;

	CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;
	GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
	GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
EOF

	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $tmp_file
	rm -rf $tmp_file

fi

exec /usr/bin/mysqld --user=mysql --log-error=/log/mariadb/err.log --console --skip-name-resolve --skip-networking=0 $@
