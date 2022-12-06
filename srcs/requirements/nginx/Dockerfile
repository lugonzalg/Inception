FROM alpine:3.17

RUN apk update && apk add nginx

COPY config/nginx.conf /etc/nginx

#ENTRYPOINT nginx -g "daemon off;pid /var/run/nginx.pid; worker_processes 2;"
ENTRYPOINT nginx -g "daemon off;"
