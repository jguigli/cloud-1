#!/bin/sh

# Ce script démarre le service MySQL, puis utilise la commande mysql pour effectuer des opérations sur la base de données. Les opérations sont les suivantes :

#     Mettre à jour le mot de passe root à MYSQL_ROOT_PASSWORD.
#     Créer une base de données nommée MYSQL_DATABASE si elle n'existe pas.
#     Créer un utilisateur nommé MYSQL_USER identifié par le mot de passe MYSQL_PASSWORD.
#     Accorder toutes les privilèges à l'utilisateur root sur toutes les bases de données et toutes les tables.
#     Accorder toutes les privilèges à MYSQL_USER sur la base de données MYSQL_DATABASE.
#     Rafraîchir les privilèges.
#     Arrêter le service MySQL.
#     Exécuter la commande mysqld_safe pour maintenir le service en cours d'exécution.

/etc/init.d/mysql start

mysql -e "UPDATE mysql.user SET Password = PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User = 'root';"
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO \`root\`@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec /usr/bin/mysqld_safe