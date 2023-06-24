#!/bin/sh

mv ./wordpress /var/www/html
if [ $? -ne 0 ];then
	echo "This host already has a wordpress project!"
	rm -rf ./wordpress
else
	echo "New Wordpress project initialiced"
fi

chown -R www-data:www-data /var/www

exec php-fpm81 --nodaemonize
