FROM alpine:3.18.2

RUN apk --no-cache add \
    lighttpd \
    php-cgi php-json php-mysqli

# Download and install Adminer
RUN apk --no-cache add wget \
    && wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/localhost/htdocs/index.php \
    && apk del wget

# Set permission
RUN chown -R lighttpd:lighttpd /var/www/localhost/htdocs/

# Configure Lighttpd to handle PHP files
RUN echo 'cgi.assign = ( ".php"  => "/usr/bin/php-cgi7" )' >> /etc/lighttpd/lighttpd.conf

EXPOSE 80

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
