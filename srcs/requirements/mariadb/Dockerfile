FROM debian:buster

RUN	apt update -y && apt upgrade -y && apt install -y \
	mariadb-server \
	procps

# SSL
# RUN openssl req -x509 -newkey rsa:2048 -sha256 -days 3650 -nodes -keyout /etc/ssl/server-key.pem -out /etc/ssl/server-cert.pem -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=guinuy.duckdns.org"

# RUN chmod 600 /etc/ssl/server-key.pem \
# 	&& chmod 600 /etc/ssl/server-cert.pem

# RUN echo "[mysqld]" >> /etc/mysql/my.cnf
# RUN echo "ssl-ca=/etc/ssl/server-cert.pem" >> /etc/mysql/my.cnf
# RUN echo "ssl-cert=/etc/ssl/server-cert.pem" >> /etc/mysql/my.cnf
# RUN echo "ssl-key=/etc/ssl/server-key.pem" >> /etc/mysql/my.cnf

# indique qu'une vérification de la santé est en cours d'exécution démarrant après un délai de 5 minutes
HEALTHCHECK --start-period=5m CMD mariadb -e 'SELECT @@datadir;' || exit 1

COPY conf/conf.cnf /etc/mysql/mariadb.conf.d/conf.cnf
COPY conf/init.sh init.sh

RUN	chmod +x init.sh \
	&& chmod -R 755 /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["./init.sh"]