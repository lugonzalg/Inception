FROM alpine:3.16

RUN apk update && apk add mysql \
	mysql-client \
	pwgen

COPY ./tools/run_copy.sh /tmp/.

CMD /tmp/run_copy.sh
