FROM alpine:3.18.2

WORKDIR tmp

# Download and install Adminer
RUN apk --no-cache add lighttpd wget \
    && wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php \
    -O ./adminer.php

RUN adduser -D -H -s /bin/false www-data -G www-data \
    && chown -R www-data:www-data /var/log/lighttpd

COPY conf/lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY tools/init.sh .
