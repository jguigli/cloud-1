all:
	ansible-playbook -i inventory.ini deploy.yaml -e="env=$(DOMAIN_NAME)"

copy_file:
	ansible-playbook -i inventory.ini playbook/copy_remote_file.yaml

launch_app:
	ansible-playbook -i inventory.ini playbook/launch_app.yaml

certbot:
	ansible-playbook -i inventory.ini playbook/certbot.yaml


.PHONY: all copy_file launch_app
