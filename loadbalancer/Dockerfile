FROM ubuntu:18.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

MAINTAINER Rostislav "rostnix@gmail.com"

ENV TERM=linux

RUN apt-get update && apt-get upgrade -y && apt-get install wget supervisor vim dos2unix curl cron rsyslog git haproxy iproute2 -y

ENV CONFD_VERSION="0.16.0" \
    CONFD_URL="https://github.com/kelseyhightower/confd/releases/download"

RUN set -x \
  && apt-get update && apt-get install -y wget --no-install-recommends && rm -rf /var/lib/apt/lists/* \
  && wget --no-check-certificate --retry-connrefused -t 5 ${CONFD_URL}/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -O /bin/confd \
  && chmod +x /bin/confd \
  && apt-get purge -y --auto-remove wget

COPY confd /etc/confd
COPY confd/supervisor/ /etc/supervisor/conf.d
COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 80 443 8000

CMD ["/usr/bin/supervisord"]
