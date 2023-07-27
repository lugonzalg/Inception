FROM alpine:3.17.3

RUN apk add nginx

RUN mkdir -p /var/www
RUN mkdir -p /var/www/html

RUN adduser -D -H -s /bin/false www-data -G www-data

COPY ./conf/nginx.conf /etc/nginx
COPY ./conf/inception.crt /etc/nginx
COPY ./conf/inception.key /etc/nginx
