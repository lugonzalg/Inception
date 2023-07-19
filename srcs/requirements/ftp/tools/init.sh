#!/bin/sh

addgroup \
	-S \
	$FTP_USER

adduser \
	-D \
	-G $FTP_USER \
	-h /home/$FTP_USER \
	-s /bin/false \
	$FTP_USER

mkdir -p /home/$FTP_USER
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd

exec vsftpd /etc/vsftpd/vsftpd.conf
