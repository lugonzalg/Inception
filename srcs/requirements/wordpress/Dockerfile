FROM alpine:3.16

RUN apk add php8-fpm

#INSTALL WORDPRESS 
RUN mkdir -p /usr/share/webapps/
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /usr/share/webapps/
