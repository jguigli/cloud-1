FROM debian:buster

RUN	apt update -y && apt upgrade -y && apt install -y \
	mariadb-server \
	procps

# indique qu'une vérification de la santé est en cours d'exécution démarrant après un délai de 5 minutes
HEALTHCHECK --start-period=5m \

# spécifie la commande à exécuter pour vérifier la santé
CMD mariadb -e 'SELECT @@datadir;' || exit 1

COPY conf/conf.cnf /etc/mysql/mariadb.conf.d/conf.cnf
COPY conf/init.sh init.sh

RUN	chmod +x init.sh \
	&& chmod -R 755 /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["./init.sh"]