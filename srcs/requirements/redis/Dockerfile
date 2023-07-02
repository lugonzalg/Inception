FROM alpine:3.18.2

RUN apk add redis

RUN mkdir data && chown redis:redis data

WORKDIR data
