#!/bin/sh

if ! [ -d /var/www ]; then
	mkdir -p /var/www
fi

if ! [ -d /var/www/html ]; then
	mkdir -p /var/www/html
fi

if [ -d ./wordpress ]; then
	mv ./wordpress/wp-admin /var/www/html
	mv ./wordpress/wp-content /var/www/html
	mv ./wordpress/wp-includes /var/www/html
	mv ./wordpress/* /var/www/html
	rmdir ./wordpress
fi

exec php-fpm81 --nodaemonize
