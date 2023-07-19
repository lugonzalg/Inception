FROM alpine:3.18.2

RUN apk add vsftpd

RUN mkdir -p /var/www && mkdir -p /var/www/html

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY tools/init.sh /tmp
