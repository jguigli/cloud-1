# Cloud-1 Deployment

This project sets up a cloud environment using Docker and Docker Compose to deploy services like MariaDB, WordPress, Nginx, and PhpMyAdmin. Ansible is used for automating the deployment process.

## Prerequisites

- **Docker**: Ensure Docker is installed on your system. You can install it using the provided `install_docker.sh` script.
- **Docker Compose**: This is included in the Docker installation script.
- **Ansible**: Required for running the deployment playbook.

## Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/jguigli/cloud-1.git
   cd cloud-1
   ```

2. **Configure Environment Variables**

   Edit the `.env` file located in `srcs/` to set your domain name and other credentials:

   ```plaintext
   DOMAIN_NAME='your-domain.duckdns.org'
   MYSQL_ROOT_PASSWORD='your-root-password'
   MYSQL_DATABASE='wordpress'
   MYSQL_USER='wordpress'
   MYSQL_PASSWORD='wordpress'
   ```

3. **Set Up Ansible Inventory**

   Edit the `inventory.ini` file in `ansible_deployment/` to specify your server's IP address and SSH details:

   ```ini
   [myhosts]
   your.server.ip.address ansible_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa
   ```

## Deployment

**Run Ansible Playbook**

   Navigate to the `ansible_deployment` directory and execute the playbook:

   ```bash
   make
   ```

   This will install necessary packages, copy files, and launch Docker Compose.


## Usage

- **Access WordPress**: Visit `https://your-domain.duckdns.org` to access your WordPress site.
- **Access PhpMyAdmin**: Visit `https://your-domain.duckdns.org/phpmyadmin/` to manage your databases.

## Maintenance

- **Renew SSL Certificates**: To renew SSL certificates, first SSH into your host machine:

  ```bash
  ssh root@your.server.ip.address
  cd ~/cloud-1/srcs
  make certbot_renew
  ```

- **Clean Up**: To stop and remove all containers and volumes, first SSH into your host machine:

  ```bash
  ssh root@your.server.ip.address
  cd ~/cloud-1/srcs
  make clean
  ```

## Troubleshooting

- **Logs**: Check Docker logs for any issues:

  ```bash
  ssh root@your.server.ip.address
  docker-compose logs
  ```

- **Rebuild**: If you need to rebuild the containers, use:

  ```bash
  ssh root@your.server.ip.address
  cd ~/cloud-1/srcs
  make rebuild
  ```

## Useful Links

[SUJET](https://cdn.intra.42.fr/pdf/pdf/84883/en.subject.pdf)  
[ANSIBLE GETTING STARTED](https://docs.ansible.com/ansible/latest/getting_started/index.html)  
[ANSIBLE INVENTORY](https://docs.ansible.com/ansible/latest/inventory_guide/index.html)  
[ANSIBLE COMMAND LINE TOOLS](https://docs.ansible.com/ansible/latest/command_guide/index.html)  
[ANSIBLE PLAYBOOK](https://docs.ansible.com/ansible/latest/playbook_guide/index.html)  
[LETS ENCRYPT TLS](https://letsencrypt.org/fr/)  
[CERTBOT TUTO](https://howto.wared.fr/ubuntu-certificats-ssl-tls-certbot/)  
[CERTBOT TUTO2](https://mindsers.blog/en/post/https-using-nginx-certbot-docker/) 
