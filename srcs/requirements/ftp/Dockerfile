FROM alpine:3.18.2

RUN apk add vsftpd

RUN adduser -D -H -s /bin/false www-data -G www-data

COPY conf/vsftpd.userlist /etc/vsftpd.userlist
COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.userlist
