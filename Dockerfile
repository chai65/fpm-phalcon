FROM php:7.1.10-fpm-alpine

ENV PHALCON_VERSION=3.2.2
#ENV PHALCON_DEV_TOOLS_VERSION=3.2.0

MAINTAINER Lê Thành <stash.leth@gmail.com>

# Compile Phalcon
RUN set -xe && \
    # Add virtual packages. It will remove when done.
    apk add --no-cache --virtual .build-deps autoconf g++ make pcre-dev && \
    curl -LO https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz && \
    tar xzf v${PHALCON_VERSION}.tar.gz && cd cphalcon-${PHALCON_VERSION}/build && sh install && \
    docker-php-ext-enable phalcon && \
    cd ../.. && rm -rf v${PHALCON_VERSION}.tar.gz cphalcon-${PHALCON_VERSION} && \
    apk del .build-deps

    # Insall Phalcon Devtools, see https://github.com/phalcon/phalcon-devtools/
#    curl -LO https://github.com/phalcon/phalcon-devtools/archive/v${PHALCON_DEV_TOOLS_VERSION}.tar.gz && \
#    tar xzf v${PHALCON_DEV_TOOLS_VERSION}.tar.gz && \
#    mv phalcon-devtools-${PHALCON_DEV_TOOLS_VERSION} /usr/local/phalcon-devtools && \
#    ln -s /usr/local/phalcon-devtools/phalcon.php /usr/local/bin/phalcon
# install another packages
RUN apk --no-cache add \
  supervisor \
  nginx \
  && rm -rf /var/cache/apk/*

COPY config/nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/run/supervisor
COPY config/supervisor/supervisord.ini /etc/supervisor/supervisord.ini

RUN mkdir -p /var/www/html/public
RUN echo "<?php phpinfo();" >> /var/www/html/public/index.php

RUN docker-php-ext-install mysqli pdo pdo_mysql

ENTRYPOINT ['/usr/bin/supervisord', '--nodaemon', '--configuration', '/etc/supervisor/supervisord.ini']
