# docker build -t anfad/mozjpeg-alpine .

FROM alpine:latest
LABEL maintainer="ANFAD <admin@anfad.fr>"

ARG MOZJPEG_VER=6.0.0
ARG CWEBP_VER=5.0.0

WORKDIR /home

RUN apk add --update --no-cache build-base autoconf automake libtool pkgconf nasm nodejs npm \
&&  npm install mozjpeg@^${MOZJPEG_VER} \
&&  npm install cwebp-bin@^${CWEBP_VER} \
&&  apk del build-base autoconf automake libtool pkgconf nasm


