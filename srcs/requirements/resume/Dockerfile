FROM alpine:3.18.2

WORKDIR tmp

RUN apk add \
	ruby-dev \
	ruby-jekyll \
	build-base

RUN gem install rails

COPY tools/init.sh .
