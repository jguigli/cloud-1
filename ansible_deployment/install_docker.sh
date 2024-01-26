#!/bin/bash

# Install Docker using apt
sudo apt update
sudo apt install -y docker.io

# Add your user to the docker group to run Docker without sudo
sudo usermod -aG docker $USER

# Install Docker Compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.24.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
