#!/bin/bash

if [[ "$1" = "get" ]]; then
	vagrant init ubuntu/trusty64
elif [[ "$1" = "up" ]]; then
	vagrant up
else
	echo "Error: Wrong paramenter $1"
	echo "	get"
	echo "	up"
fi
