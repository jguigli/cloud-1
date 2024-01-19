## CLOUD-1 

[SUJET](https://cdn.intra.42.fr/pdf/pdf/84883/en.subject.pdf)  
[ANSIBLE GETTING STARTED](https://docs.ansible.com/ansible/latest/getting_started/index.html)  
[ANSIBLE INVENTORY](https://docs.ansible.com/ansible/latest/inventory_guide/index.html)  
[ANSIBLE COMMAND LINE TOOLS](https://docs.ansible.com/ansible/latest/command_guide/index.html)  
[ANSIBLE PLAYBOOK](https://docs.ansible.com/ansible/latest/playbook_guide/index.html)  
[LETS ENCRYPT TLS](https://letsencrypt.org/fr/)  
[CERTBOT TUTO](https://howto.wared.fr/ubuntu-certificats-ssl-tls-certbot/)  

# SUJET

Le déploiement de votre application doit être entièrement automatisé. Nous vous suggérons d'utiliser Ansible, mais vous êtes libre d'utiliser un autre outil si vous le souhaitez. Il est impératif de fournir un site fonctionnel équivalent à celui obtenu avec Inception en utilisant uniquement votre script.

## OK :
• Vos applications fonctionneront dans des conteneurs distincts capables de communiquer entre eux (1 processus = 1 conteneur).  
• L'accès public à votre serveur doit être limité et sécurisé (par exemple, il n'est pas possible de se connecter directement à votre base de données depuis Internet).  
• Votre serveur doit pouvoir, lorsque c'est possible, utiliser TLS.  
• Vous devez disposer d'un fichier docker-compose.yml.  
• En cas de redémarrage, toutes les données du site sont persistantes (images, comptes d'utilisateurs, articles, ...).  
• Vous devrez vous assurer que votre base de données SQL fonctionne avec WordPress et PHPMyAdmin.  
• Les services seront les différents composants d'un WordPress à installer par vous-même. Par exemple, Phpmyadmin, MySQL...    
• Votre site peut redémarrer automatiquement si le serveur est redémarré.  
• Verifier que apt-get est bien sur le serveur cloud  
• Le script doit pouvoir fonctionner de manière automatisée avec une seule hypothèse : un système d'exploitation Ubuntu 20.04 LTS tel que celui de l'instance cible exécutant un démon SSH et avec Python installé.  
• Il est possible de déployer votre site sur plusieurs serveurs en parallèle.  


## PAS OK :
• Vous devrez vous assurer que, en fonction de l'URL demandée, votre serveur redirige vers le site correct.  
• Openssl a virer du dockerfile nginx (remplacer par certbot)
• Creer volume pour certificats cert-bot


# COMMAND TO DEPLOY

	ssh-keygen -f "/home/joel/.ssh/known_hosts" -R "192.168.1.81"
	ssh-copy-id jguigli@192.168.1.81
	ansible-playbook -i inventory.ini deploy.yaml --ask-become-pass

# DEPENDANCES

	pip3 install --user ansible  

# CHECKING

Verify inventory.ini :

	ansible-inventory -i inventory.ini --list

Renouvellement cert-bot :

	certbot renew
