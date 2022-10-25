FROM alpine:3.16

RUN apk update && apk add nginx \
	vim

COPY ./tools/nginx.conf /etc/nginx/.

COPY ./tools/default.conf /etc/nginx/http.d/.

RUN nginx -g 'pid /run/nginx/nginx.pid;'

CMD nginx -g 'daemon off;'
