FROM alpine:3.18.2

WORKDIR tmp

RUN apk add \
	ruby-dev \
	ruby-jekyll \
	git \
	tzdata \
	build-base

RUN gem install \
	rails \
	tzinfo-data

COPY tools/init.sh .
