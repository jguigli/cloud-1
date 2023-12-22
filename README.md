## Inception  

[SUJET](https://cdn.intra.42.fr/pdf/pdf/84883/en.subject.pdf)
[ANSIBLE](https://docs.ansible.com/ansible/latest/getting_started/index.html)

# SUJET

Le déploiement de votre application doit être entièrement automatisé. Nous vous suggérons d'utiliser Ansible, mais vous êtes libre d'utiliser un autre outil si vous le souhaitez. Il est impératif de fournir un site fonctionnel équivalent à celui obtenu avec Inception en utilisant uniquement votre script.

OK :
• Vos applications fonctionneront dans des conteneurs distincts capables de communiquer entre eux (1 processus = 1 conteneur).
• L'accès public à votre serveur doit être limité et sécurisé (par exemple, il n'est pas possible de se connecter directement à votre base de données depuis Internet).
• Votre serveur doit pouvoir, lorsque c'est possible, utiliser TLS.
• Vous devez disposer d'un fichier docker-compose.yml.
• En cas de redémarrage, toutes les données du site sont persistantes (images, comptes d'utilisateurs, articles, ...).


PAS OK :
• Vous devrez vous assurer que votre base de données SQL fonctionne avec WordPress et PHPMyAdmin.
• Vous devrez vous assurer que, en fonction de l'URL demandée, votre serveur redirige vers le site correct.
• Votre site peut redémarrer automatiquement si le serveur est redémarré.
• Il est possible de déployer votre site sur plusieurs serveurs en parallèle.
• Le script doit pouvoir fonctionner de manière automatisée avec une seule hypothèse : un système d'exploitation Ubuntu 20.04 LTS tel que celui de l'instance cible exécutant un démon SSH et avec Python installé.
• Les services seront les différents composants d'un WordPress à installer par vous-même. Par exemple, Phpmyadmin, MySQL, ...




VM : Debian Buster / Alpine Linux  

- Docker compose  
- Docker file : https://docs.docker.com/engine/reference/builder/#:~:text=A%20Dockerfile%20is%20a%20text,can%20use%20in%20a%20Dockerfile%20.  

Les Dockerfiles seront appelés dans votre fichier docker-compose.yml par votre Makefile.  

• Un container Docker contenant NGINX avec TLSv1.2 ou TLSv1.3 uniquement.  
• Un container Docker contenant WordPress + php-fpm (installé et configuré) uniquement sans nginx.  
• Un container Docker contenant MariaDB uniquement sans nginx.  
• Un volume contenant votre base de données WordPress.  
• Un second volume contenant les fichiers de votre site WordPress.  
• Un docker-network qui fera le lien entre vos containers.  

/!\ Informez-vous sur le fonctionnement des ’daemons’ et dans quels cas y avoir recours est pertinent.  

/!\ Renseignez-vous sur les bonnes pratiques d’écriture de Dockerfiles et le "PID 1".  

Docker compose :

	Lancer : 
		- docker-compose -f  <path_docker_compose>  -d —build

	Arrêter :
		- docker-compose -f  <path_docker_compose>  stop

	Supprimer le build :
		- docker-compose -f  <path_docker_compose>  down -v


TUTORIEL INCEPTION GRADEME JCLUZET : https://tuto.grademe.fr/inception/  

LIEN RAPHIKY DOCKER : https://www.freecodecamp.org/news/the-docker-handbook/amp/  

IMAGE MARIADB : https://mariadb.com/kb/en/creating-a-custom-docker-image/  
				https://kinsta.com/blog/mariadb-docker/  

INSTALLATION et CONFIGURATION MARIADB : https://www.val-r.fr/geek/os/linux/installer-un-serveur-linux-sous-debian/installation-et-configuration-du-serveur-mysql-mariadb/  
 


TODO :  
- Copier les repertoires filezila au bon endroit  
cd FileZilla3  
sudo cp -r bin/* /usr/bin  
sudo cp -r share/* /usr/share  
sudo cp -r lib/* /usr/lib  

- Rajout inception-panel.fr dans /etc/hosts  

INFO CORR :  

How Docker and docker compose work  
- Docker : virtualise l'app, les dependances et les fichiers bin.  
- Docker compose : Lis le fichier docker-compose.yml, et fait tourner de multiples conteneurs  

The difference between a Docker image used with docker compose and without docker compose :  
- Creation de sa propre image avec ses propres paquets et fichier de configuration  

The benefit of Docker compared to VMs  
- Utilisation du kernel hote, pas de virtulisation a ce niveau  

Simple explanation of docker-network :  
- Les conteneurs qui utilisent ce réseau bridge, ne peuvent communiquer qu’entre eux, cependant ils ne sont pas accessibles depuis l’extérieur si un mappage de port n'est pas mise en place.  

Creer une page en admin et verifier la persistence  

rentrer dans la database mariadb :  
- mysql -u root -p  
- (e.g)SHOW DATABASES;  

NGINX : Try to access the service via http (port 80) and verify that you cannot connect ??????????????????????????  