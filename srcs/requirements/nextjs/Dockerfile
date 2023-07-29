FROM alpine:3.18.2

RUN adduser -D -H -s /bin/false www-data -G www-data

RUN \
	apk update \
	&& apk add nodejs npm \
	&& mkdir -p /usr/src /usr/src/app

WORKDIR /usr/src/app

COPY tools/init.sh /tmp
