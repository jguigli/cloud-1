all:
	mkdir -p ~/data
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress_log
	mkdir -p ~/data/nginx_cert
	mkdir -p ~/data/certbot_data
	docker-compose -f ./docker-compose.yml up --build -d

re: clean all

certbot:
	docker-compose run --rm  certbot -v certonly --register-unsafely-without-email --agree-tos --webroot --webroot-path /var/www/certbot/ -d guinuy.duckdns.org

certbot_dry_run:
	docker-compose run --rm  certbot -v certonly --dry-run --register-unsafely-without-email --agree-tos --webroot --webroot-path /var/www/certbot/ -d guinuy.duckdns.org

certbot_renew:
	docker compose run --rm certbot renew

build:
	docker-compose -f ./docker-compose.yml build

down:
	docker-compose -f ./docker-compose.yml down

run:
	docker-compose -f ./docker-compose.yml up

rerun: rebuild run

rebuild: clean build

clean: down
	sudo rm -rf ~/data
	docker volume rm -f srcs_mdb
	docker volume rm -f srcs_wp
	docker volume rm -f srcs_wp_log
	docker volume rm -f srcs_ng_cert
	docker volume rm -f srcs_cert_data
	docker system prune -a -f

.PHONY: all re certbot certbot_dry_run certbot_renew build down run rerun rebuild clean
