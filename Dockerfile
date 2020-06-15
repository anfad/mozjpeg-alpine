# docker build -t anfad/mozjpeg-alpine .

FROM alpine:latest as builder

ARG tag=v3.3.1

WORKDIR /src/mozjpeg

RUN apk --update --no-cache add build-base autoconf automake libtool pkgconf nasm tar \
&&  wget -qO- https://github.com/mozilla/mozjpeg/archive/$tag.tar.gz | tar xz \
&&  cd mozjpeg-* \
&&  autoreconf -fiv \
&&  sh configure \
&&  make install prefix=/usr/local libdir=/usr/local/lib64

FROM alpine:latest
LABEL maintainer="ANFAD <admin@anfad.fr>"

COPY --from=builder /usr/local /usr/local