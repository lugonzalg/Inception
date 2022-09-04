FROM alpine:3.16

RUN apk update && apk add nginx

COPY ./tools/nginx.conf /etc/nginx/.

RUN nginx -g 'pid /run/nginx/nginx.pid;'

CMD nginx -g 'daemon off;'
