#!/bin/sh

if ! [ -d /var/www ]; then
	mkdir -p /var/www
fi

if ! [ -d /var/www/html ]; then
	mkdir -p /var/www/html
fi

if [ -d ./wordpress ]; then
	mv ./wordpress /var/www/html
fi

exec php-fpm81 --nodaemonize
