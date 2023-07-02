FROM alpine:3.17.3

RUN apk add redis

RUN mkdir data && chown redis:redis data

WORKDIR data
