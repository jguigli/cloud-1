FROM debian:buster

RUN apt-get update && apt-get install -y \
    apt-utils \
    php7.3 \
    php-cli \
    php-fpm \
    php-mysql \
    php-redis \
    mariadb-client \
	mariadb-server \
    wget \
    procps

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN	mkdir -p /var/www/wordpress \
    && mkdir -p /var/log/auth.log \
    && chmod -R 755 /var/www/wordpress \
    && chown -R root:root /var/www/wordpress

RUN mkdir -p /var/run/php \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY conf/init.sh init.sh
RUN	chmod +x init.sh

EXPOSE 9000

ENTRYPOINT ["./init.sh"]