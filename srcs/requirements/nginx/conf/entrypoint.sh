#! /bin/env

sed -i 's/${DOMAIN_NAME}/'$DOMAIN_NAME'/' /etc/nginx/sites-available/nginx.conf
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

exec "$@"
