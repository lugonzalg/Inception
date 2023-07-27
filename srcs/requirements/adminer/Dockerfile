FROM alpine:3.17.3

WORKDIR /var/www/adminer

RUN apk add --no-cache \
    php \
    php-session \
    php-fpm \
    php-mysqli \
    php-json \
    php-openssl \
    php-curl \
    php-zlib \
    php-xml \
    php-phar \
    php-intl \
    php-dom \
    php-xmlreader \
    php-ctype \
    php-mbstring \
    php-gd \
    wget \
    && wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php \
    -O ./adminer.php

RUN adduser -D -H -s /bin/false www-data -G www-data \
    && chown -R www-data:www-data /var/log/php81

COPY ./conf/www.conf /etc/php81/php-fpm.d/
COPY ./conf/php.ini /etc/php81/php.ini
