FROM alpine:3.17.3

RUN apk update

RUN apk add --no-cache \
    php \
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
    php-gd

RUN wget https://wordpress.org/latest.tar.gz \
    tar -xzf latest.tar.gz \
    mv wordpress /var/www/html/ \
    && rm latest.tar.gz
