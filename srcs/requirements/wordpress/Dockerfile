FROM alpine:3.18.2

RUN apk update

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
    php-gd
    #php-pecl-redis

RUN adduser -D -H -s /bin/false www-data -G www-data

RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xzf latest.tar.gz \
	&& rm latest.tar.gz

COPY ./conf/wp-config.php ./wordpress
COPY ./tools/init.sh .
COPY ./conf/www.conf /etc/php81/php-fpm.d/
COPY ./conf/php.ini /etc/php81/php.ini
