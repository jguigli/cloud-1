#!/bin/sh

# Ce script démarre le service MySQL, puis utilise la commande mysql pour effectuer des opérations sur la base de données. Les opérations sont les suivantes :

/etc/init.d/mysql start

#     Mettre à jour le mot de passe root à MYSQL_ROOT_PASSWORD.
mysql -e "UPDATE mysql.user SET Password = PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User = 'root';"

#     Créer une base de données nommée MYSQL_DATABASE si elle n'existe pas.
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

#     Créer un utilisateur nommé MYSQL_USER identifié par le mot de passe MYSQL_PASSWORD.
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

#     Accorder toutes les privilèges à l'utilisateur root sur toutes les bases de données et toutes les tables.
mysql -e "GRANT ALL PRIVILEGES ON *.* TO \`root\`@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

#     Accorder toutes les privilèges à MYSQL_USER sur la base de données MYSQL_DATABASE.
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

#     Rafraîchir les privilèges.
mysql -e "FLUSH PRIVILEGES;"

#     Arrêter le service MySQL.
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

#     Exécuter la commande mysqld_safe pour maintenir le service en cours d'exécution.
exec /usr/bin/mysqld_safe