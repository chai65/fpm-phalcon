FROM chai65/fpm-phalcon:lastest


MAINTAINER Lê Thành <stash.leth@gmail.com>

RUN apk --no-cache add \
  supervisor \
  && rm -rf /var/cache/apk/*

COPY config/supervisor /etc/supervisor

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/run/supervisor

CMD ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisor/conf.d/supervisord.conf","--logfile", "/var/log/supervisor/supervisord.log","--pidfile", "/var/run/supervisor/supervisord.pid"]
