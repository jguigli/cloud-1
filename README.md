## CLOUD-1 

[SUJET](https://cdn.intra.42.fr/pdf/pdf/84883/en.subject.pdf)  
[ANSIBLE GETTING STARTED](https://docs.ansible.com/ansible/latest/getting_started/index.html)  
[ANSIBLE INVENTORY](https://docs.ansible.com/ansible/latest/inventory_guide/index.html)
[ANSIBLE COMMAND LINE TOOLS](https://docs.ansible.com/ansible/latest/command_guide/index.html)
[ANSIBLE PLAYBOOK](https://docs.ansible.com/ansible/latest/playbook_guide/index.html)

# SUJET

Le déploiement de votre application doit être entièrement automatisé. Nous vous suggérons d'utiliser Ansible, mais vous êtes libre d'utiliser un autre outil si vous le souhaitez. Il est impératif de fournir un site fonctionnel équivalent à celui obtenu avec Inception en utilisant uniquement votre script.

OK :
• Vos applications fonctionneront dans des conteneurs distincts capables de communiquer entre eux (1 processus = 1 conteneur).  
• L'accès public à votre serveur doit être limité et sécurisé (par exemple, il n'est pas possible de se connecter directement à votre base de données depuis Internet).  
• Votre serveur doit pouvoir, lorsque c'est possible, utiliser TLS.  
• Vous devez disposer d'un fichier docker-compose.yml.  
• En cas de redémarrage, toutes les données du site sont persistantes (images, comptes d'utilisateurs, articles, ...).  
• Vous devrez vous assurer que votre base de données SQL fonctionne avec WordPress et PHPMyAdmin.  


PAS OK :
• Vous devrez vous assurer que, en fonction de l'URL demandée, votre serveur redirige vers le site correct.  
• Votre site peut redémarrer automatiquement si le serveur est redémarré.  
• Il est possible de déployer votre site sur plusieurs serveurs en parallèle.  
• Le script doit pouvoir fonctionner de manière automatisée avec une seule hypothèse : un système d'exploitation Ubuntu 20.04 LTS tel que celui de l'instance cible exécutant un démon SSH et avec Python installé.  
• Les services seront les différents composants d'un WordPress à installer par vous-même. Par exemple, Phpmyadmin, MySQL...  
• Pas de de privilege ADMIN sur phpmyadmin


# COMMAND TO DEPLOY

	ansible-playbook -i inventory.ini deploy.yml

# DEPENDANCES

	pip install ansible  

# CHECKING

Verify inventory.ini :

	ansible-inventory -i inventory.ini --list