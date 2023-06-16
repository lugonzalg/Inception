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
    && tar -xzf latest.tar.gz \
    && chown -R root:root ./wordpress \
    && rm latest.tar.gz

COPY ./config/wp-config.php ./wordpress
COPY ./tools/init.sh .
