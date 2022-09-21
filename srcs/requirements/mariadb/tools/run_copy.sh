#CREATE MYSQLD DIR

#-d : file exists and is a directory
if [ -d "/run/mysqld" ]; then
	echo "MYSQLD DIR ALREADY EXISTS"
else
	echo "MYSQLD DOESN'T EXIST"
	mkdir -p /run/mysqld
fi
chown -R mysql:mysql /run/mysqld

if [ -d "/run/mysql/mysql" ]; then
	echo "MYSQL - DATABASE ALREADY EXISTS"
else
	echo "MYSQL - CREATING NEW DATABASE"
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

	if [ "$MYSQL_ROOT_PASSWORD" = "" ]; then
		MYSQL_ROOT_PASSWORD=pwgen 16 1
		echo "MYSQL CREATING ROOT PASSWORD $MYSQL_ROOT_PASSWORD"
	fi

	#SET ENV
	#MYSQL_DATABASE=${MYSQL_DATADABE:-""}
	#MYSQL_USER=${MYSQL_USER:-""}
	#MYSQL_PASSWORD=${MYSQL_PASSWORD:-""}

	MYSQL_DATABASE="inception"
	MYSQL_USER="lukas"
	MYSQL_PASSWORD=pwgen 16 1

	#CREATE TEMPORAL FILE
	tmp_file=mktemp

	#ERROR CONTROL
	if [ -f "$tmp_file" ]; then
		return 1
	fi

	echo \
	"USE mysql;
	FLUSH PRIVILEGES ;
	GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
	GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
	SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
	DROP DATABASE IF EXISTS test ;
	FLUSH PRIVILEGES ;" >> $tmp_file

	if [ "$MYSQL_DATABASE" = "" ];then
		echo CREATING DATABASE:" $MYSQL_DATABASE"
		if [ "$MYSQL_CHARSET" != "" ] && [ "$MYSQL_COLLATION" != "" ]; then
			echo "CREATE DATABASE IF NOT EXISTS \'$MYSQL_DATABASE\' CHARACTER SET $MYSQL_CHARSET COLLATE $MYSQL_COLLATION;" >> $tmp_file
		else
			echo "EMPTY $MYSQL_CHARSET OR/AND $MYSQL_COLLATION"
			echo "CREATE DATABASE IF NOT EXISTS \'$MYSQL_DATABASE\' CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tmp_file
		fi
		if [ "$MYSQL_USER" != "" ]; then
			echo "CREATING USER FOR THE DATABASE"
			echo "GRANT ALL ON \'$MYSQL_DATABASE\'.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tmp_file
		fi
	fi

	/usr/bin/mysql --user=mysql --bootstrap --verbose=0 --skin-name-resolve --skip-networking=0 < $tmp_file
	rm -f $tmp_file
fi

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@
