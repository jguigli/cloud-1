#!/bin/bash

CERT_PATH="/etc/letsencrypt/live/$DOMAIN_NAME"
# FULLCHAIN_PATH="$CERT_PATH/fullchain.pem"
# PRIVKEY_PATH="$CERT_PATH/privkey.pem"

docker exec nginx ls "$CERT_PATH" > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "Fullchain and privkey not found"
	while true; do
		if [ "$(docker inspect --format '{{.State.Status}}' "nginx" 2>/dev/null)" = "running" ]; then
			docker compose run --rm  certbot -v certonly --register-unsafely-without-email --agree-tos --webroot --webroot-path /var/www/certbot/ -d $DOMAIN_NAME
			sed -i 's/#//' ./requirements/nginx/conf/nginx.conf
			docker compose -f ./docker-compose.yml up --build -d
			break
		else
			echo "Waiting for nginx container to run."
			sleep 5
		fi
	done
else
    echo "Fullchain and privkey found. No need to create new certificates."
    sed -i 's/#//' ./requirements/nginx/conf/nginx.conf
    docker compose -f ./docker-compose.yml up --build -d
fi
