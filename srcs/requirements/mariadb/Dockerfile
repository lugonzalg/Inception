FROM alpine:3.17.3

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils pwgen

COPY ./tools/init.sh /tmp
COPY ./conf/my.cnf /etc
