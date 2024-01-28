all:
	ansible-playbook -i inventory.ini deploy.yaml -e="env=$(DOMAIN_NAME)"

copy_file:
	ansible-playbook -i inventory.ini playbook/copy_remote_file.yaml

launch_app:
	ansible-playbook -i inventory.ini playbook/launch_app.yaml

certbot:
	ansible-playbook -i inventory.ini playbook/certbot.yaml -e="env=$(DOMAIN_NAME)"

check_containers:
	ansible-playbook -i inventory.ini playbook/docker/check_containers.yaml

restart_container:
	ansible-playbook -i inventory.ini playbook/docker/restart_container.yaml

clean:
	ansible-playbook -i inventory.ini playbook/clean.yaml

.PHONY: all copy_file launch_app certbot check_containers restart_container clean
