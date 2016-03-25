FROM gliderlabs/alpine:3.3
MAINTAINER Cliff Moon <cliff@opsee.co>

# A good bit of this is from https://github.com/frol/docker-alpine-oraclejdk8
# Thanks! <3

ENV JAVA_VERSION=8 \
    JAVA_UPDATE=45 \
    JAVA_BUILD=14 \
    JAVA_HOME=/usr/lib/jvm/default-jvm


RUN apk add --update openssl bash git build-base m4 autoconf automake libtool ca-certificates wget postgresql-client && \
    wget https://github.com/google/protobuf/archive/v3.0.0-beta-2.tar.gz && \
    tar -xzf v3.0.0-beta-2.tar.gz && \
    cd protobuf-3.0.0-beta-2 && \
    ./autogen.sh && \
    ./configure --disable-debug --disable-dependency-tracking && \
    make && \
    make install  && \
    cd /tmp

VOLUME /build
