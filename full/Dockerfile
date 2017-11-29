FROM chai65/fpm-phalcon

MAINTAINER Lê Thành <stash.leth@gmail.com>

ENV MONGODB_VERSION=1.2.10
ENV REDIS_VERSION=3.1.3


RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add php7-json php7-mongodb php7-redis php7-bcmath php7-zip php7-xsl php7-pcntl php7-shmop && \
    mv /usr/lib/php7/modules/* /usr/local/lib/php/extensions/no-debug-non-zts-20160303 && \
    echo "extension=json.so" >> /usr/local/etc/php/conf.d/json.ini && \
    echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini && \
    echo "extension=redis.so" >> /usr/local/etc/php/conf.d/redis.ini && \
    echo "extension=bcmath.so" >> /usr/local/etc/php/conf.d/bcmath.ini && \
    echo "extension=zip.so" >> /usr/local/etc/php/conf.d/zip.ini && \
    echo "extension=xsl.so" >> /usr/local/etc/php/conf.d/xsl.ini && \
    echo "extension=pcntl.so" >> /usr/local/etc/php/conf.d/pcntl.ini && \
    echo "extension=shmop.so" >> /usr/local/etc/php/conf.d/shmop.ini && \
    echo "zend_extension=opcache.so" >> /usr/local/etc/php/conf.d/opcache.ini