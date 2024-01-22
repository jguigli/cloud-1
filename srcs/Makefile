all:
	mkdir -p ~/data
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress_log
	mkdir -p ~/data/nginx_cert
	mkdir -p ~/data/nginx_conf
	mkdir -p ~/data/certbot_data
	docker-compose -f ./docker-compose.yml up --build -d

re: clean all

certbot:
	docker-compose run --rm certbot certonly --webroot -w /var/www/certbot --agree-tos --no-eff-email --email 'user@guinuy.duckdns.org' --dry-run -d jguigli.42.fr -d www.jguigli.42.fr --rsa-key-size 4096

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
	docker volume rm -f srcs_ng_conf
	docker volume rm -f srcs_cert_data
	docker system prune -a -f

.PHONY: all re build down run rerun rebuild clean
