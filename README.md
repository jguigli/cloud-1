## CLOUD-1 

[SUJET](https://cdn.intra.42.fr/pdf/pdf/84883/en.subject.pdf)  
[ANSIBLE GETTING STARTED](https://docs.ansible.com/ansible/latest/getting_started/index.html)  
[ANSIBLE INVENTORY](https://docs.ansible.com/ansible/latest/inventory_guide/index.html)  
[ANSIBLE COMMAND LINE TOOLS](https://docs.ansible.com/ansible/latest/command_guide/index.html)  
[ANSIBLE PLAYBOOK](https://docs.ansible.com/ansible/latest/playbook_guide/index.html)  
[LETS ENCRYPT TLS](https://letsencrypt.org/fr/)  
[CERTBOT TUTO](https://howto.wared.fr/ubuntu-certificats-ssl-tls-certbot/)  
[CERTBOT TUTO2](https://mindsers.blog/en/post/https-using-nginx-certbot-docker/)  

# COMMAND TO DEPLOY

In directory /ansible_deployment, configurate the file `inventory.ini` with your cloud IP address.
Then use :

	make ansible

# DEPENDANCIES

On host machine :

	pip3 install --user ansible  
