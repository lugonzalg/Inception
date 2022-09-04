FROM alpine:3.16

RUN apk update && apk add nginx

#COPY ./tools/nginx.conf /etc/nginx/.

RUN nginx -g 'pid /run/nginx/nginx.pid;'

CMD ["/bin/sh", "exec nginx -g 'daemon off;'"]
#CMD ["nginx"]
#ENTRYPOINT ["nginx"]
#CMD ["nginx -g \'pid /tmp/nginx.pid\;\'"]
