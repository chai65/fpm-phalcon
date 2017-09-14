FROM chai65/alpine-phalcon-nginx

MAINTAINER Lê Thành <stash.leth@gmail.com>

ENV MONGODB_VERSION=1.2.10
ENV REDIS_VERSION=3.1.3


RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add php7-json php7-mongodb php7-redis && \
    mv /usr/lib/php7/modules/* /usr/local/lib/php/extensions/no-debug-non-zts-20160303 && \
    echo "extension=redis.so" >> /usr/local/etc/php/conf.d/redis.ini && \
    echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini