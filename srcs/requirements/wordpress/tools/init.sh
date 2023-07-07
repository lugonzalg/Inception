#!/bin/sh

file_count=$(ls /var/www/html | wc -l)
if [ $file_count -eq 0 ]; then
	mv ./wordpress/* /var/www/html/
fi

rm -rf ./wordpress

if [ $? -ne 0 ];then
	echo "This host already has a wordpress project!"
else
	echo "New Wordpress project initialiced"
fi

chown -R www-data:www-data /var/www

exec php-fpm81 --nodaemonize
