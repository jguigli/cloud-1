#!/bin/sh

# Ce script effectue les étapes suivantes pour installer Wordpress avec les paramètres de configuration définis :


#     Télécharge la dernière version de Wordpress dans le répertoire /var/www/wordpress
wp core download --path=/var/www/wordpress --allow-root --locale=fr_FR

#     Crée un fichier de configuration pour Wordpress avec les informations de la base de données, telles que le nom de la base de données, l'utilisateur, le mot de passe et l'hôte de la base de données MariaDB.
# wp config create --path=/var/www/wordpress --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306

#     Installe Wordpress en définissant l'URL, le titre, les informations d'administration et en sautant l'envoi d'un email.
wp core install --path=/var/www/wordpress --allow-root --url=https://guinuy.duckdns.org --title="CLOUD-1" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=jguigli@42.fr --skip-email

#     Crée un utilisateur Wordpress avec les informations définies pour le nom d'utilisateur, l'email et le mot de passe.
wp user create --path=/var/www/wordpress --allow-root $WORDPRESS_USER_LOGIN $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD


chown -R www-data:www-data /var/www/wordpress/
chmod -R 777 /var/www/wordpress/


#     Installe le plugin redis cache et l'active
#Installation du plugin Redis cache pour Wordpress
# wp config set WP_REDIS_HOST redis --allow-root --path=/var/www/wordpress
# wp config set WP_REDIS_PORT 6379 --raw --allow-root --path=/var/www/wordpress
# wp config set WP_REDIS_CLIENT phpredis --allow-root --path=/var/www/wordpress
# wp config set WP_CACHE_KEY_SALT guinuy.duckdns.org --allow-root --path=/var/www/wordpress
# wp config set WP_CACHE true --allow-root --path=/var/www/wordpress
# wp config set FS_METHOD direct --allow-root --path=/var/www/wordpress
# wp plugin install redis-cache --activate --path=/var/www/wordpress --allow-root
# wp plugin update --all --allow-root --path=/var/www/wordpress
# wp redis enable --allow-root --path=/var/www/wordpress

#     Crée un répertoire pour le processus PHP.
mkdir -p /run/php

#     Exécute enfin le processus PHP-FPM.
exec /usr/sbin/php-fpm7.3 -F --allow-to-run-as-root --nodaemonize