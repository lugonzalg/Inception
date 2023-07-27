#!/bin/sh

file_count=$(ls /var/www | wc -l)
if [ $file_count -eq 0 ]; then
	rails new /var/www/resume
	echo "Error: resume not found, creating one!"
else
	echo "OK: resume found."
fi

cd /var/www/resume

exec rails server -b 0.0.0.0
