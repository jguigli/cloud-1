FROM debian:buster

RUN apt update -y && apt-get install -y \
	apache2 \
	procps

COPY tools/ /var/www/html

RUN chmod -R 755 /var/www/html

COPY conf/apache.conf /etc/apache2/sites-available/000-default.conf

RUN ln -s /etc/apache2/sites-available/apache.conf /etc/apache2/sites-enabled/

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]