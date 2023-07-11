#!/bin/sh

if [ ! -f /var/www/html/adminer.php ]; then
	echo "No adminer found in wordpress!"

	echo "Setting credentials for adminer ... "
	chown www-data:www-data ./adminer.php
	mv ./adminer.php ./wp-adminer.php
	mv ./wp-adminer.php /var/www/html
else
	echo "Adminer found in wordpress!!"
	rm ./adminer.php
fi

exec lighttpd -D -f /etc/lighttpd/lighttpd.conf
