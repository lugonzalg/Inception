#!/bin/sh

if [ ! -f /tmp/resume ]; then
	echo "Error: resume not found, creating one!"
	rails new resume
else
	echo "OK: resume found."
fi

exec rails server -b 0.0.0.0
