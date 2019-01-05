#!/bin/bash

set -x

/bin/confd -onetime -backend env

chown -R www-data:www-data /var/www/wordpress && chmod -R 755 /var/www/wordpress
ln -s /etc/nginx/sites-available/photoanna /etc/nginx/sites-enabled/

service nginx restart
service php7.2-fpm restart
