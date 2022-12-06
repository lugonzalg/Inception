FROM alpine 3:17

RUN apk update && apk add php8.0-fpm php8.0-common php8.0-mysql \
	php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd \
	php8.0-imagick php8.0-cli php8.0-dev php8.0-imap \
	php8.0-mbstring php8.0-opcache php8.0-redis \
	php8.0-soap php8.0-zip -y

RUN mkdir -p /usr/share/webapps/ \
	&& wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& chown -R /usr/share/webapps \
	&& ln -s /usr/share/webapps/wordpress/ /data/www
	
