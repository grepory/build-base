FROM gliderlabs/alpine:3.2
MAINTAINER Cliff Moon <cliff@opsee.co>

RUN apk add --update openssl bash git build-base m4 autoconf automake libtool && \
	wget https://github.com/google/protobuf/archive/v3.0.0-alpha-3.tar.gz && \
    tar -xzf v3.0.0-alpha-3.tar.gz && \
    cd protobuf-3.0.0-alpha-3 && \
    ./autogen.sh && \
    ./configure --disable-debug --disable-dependency-tracking && \
    make && \
    make install 

VOLUME /build

COPY build.sh /build.sh

CMD ["/build.sh"]
