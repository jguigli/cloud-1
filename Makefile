all:
	mkdir -p ~/data
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress_log
	docker-compose -f ./srcs/docker-compose.yml up --build -d

re: clean all

build:
	docker-compose -f ./srcs/docker-compose.yml build

down:
	docker-compose -f ./srcs/docker-compose.yml down

run:
	docker-compose -f ./srcs/docker-compose.yml up

rerun: rebuild run

rebuild: clean build

clean: down
	sudo rm -rf ~/data
	docker volume rm -f srcs_mdb
	docker volume rm -f srcs_wp
	docker volume rm -f srcs_wp_log
	docker system prune -a -f

.PHONY: all re build down run rerun rebuild clean
