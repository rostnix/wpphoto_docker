FROM ubuntu:18.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

MAINTAINER Rostislav "rostnix@gmail.com"

ENV TERM=linux
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y && apt-get install wget supervisor vim dos2unix curl cron rsyslog git php-curl php-gd php-mbstring php-xml php-xmlrpc nginx php-fpm php-mysql php-common php-soap  php-intl php-cli php-zip -y

ENV CONFD_VERSION="0.16.0" \
    CONFD_URL="https://github.com/kelseyhightower/confd/releases/download"

RUN set -x \
  && apt-get update && apt-get install -y wget --no-install-recommends && rm -rf /var/lib/apt/lists/* \
  && wget --no-check-certificate --retry-connrefused -t 5 ${CONFD_URL}/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -O /bin/confd \
  && chmod +x /bin/confd

RUN wget https://wordpress.org/latest.tar.gz && cd /var/www && tar xpf /latest.tar.gz && chown -R www-data:www-data /var/www/wordpress && chmod -R 755 /var/www/wordpress

COPY confd /etc/confd
COPY confd/supervisor/ /etc/supervisor/conf.d
COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 80 443
#RUN dos2unix /entrypoint.sh

CMD ["/usr/bin/supervisord"]
