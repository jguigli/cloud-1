all: check_env check_usage
	ansible-playbook -i inventory.ini deploy.yaml -e="env=$(DOMAIN_NAME)"

copy_file: check_env
	ansible-playbook -i inventory.ini playbook/copy_remote_file.yaml

launch_app: 
	ansible-playbook -i inventory.ini playbook/launch_app.yaml

certbot: check_usage
	ansible-playbook -i inventory.ini playbook/certbot.yaml -e="env=$(DOMAIN_NAME)"

check_containers:
	ansible-playbook -i inventory.ini playbook/docker/check_containers.yaml

restart_container:
	ansible-playbook -i inventory.ini playbook/docker/restart_container.yaml

clean:
	ansible-playbook -i inventory.ini playbook/clean.yaml

check_usage:
	@if [ -z "$(DOMAIN_NAME)" ]; then \
		echo "Error: DOMAIN_NAME is not defined."; \
		echo "Usage: make <rule> DOMAIN_NAME=<fully_qualified_domain_name>"; \
		exit 1; \
	fi

check_env:
	@if [ ! -e "../srcs/.env" ]; then \
		echo "Error: File '../srcs/.env' is missing."; \
		exit 1; \
	fi

.PHONY: all copy_file launch_app certbot check_containers restart_container clean check_usage check_env
