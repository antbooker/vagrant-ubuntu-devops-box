#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

# Install Docker
apt-get remove docker docker-engine docker.io containerd runc -y
apt-get update -y
apt-get install --no-install-recommends apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
apt-get update -y
apt-get install --no-install-recommends docker-ce docker-ce-cli containerd.io -y

# Install Docker Compose
DOCKER_COMPOSE_VERSION=$(curl -sX GET "https://api.github.com/repos/docker/compose/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]')
curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Run tests to determine that the software installed as expected
echo "Testing docker installation"
if ! command -v docker; then
    echo "docker was not installed"
    exit 1
fi
echo "Testing docker-compose installation"
if ! command -v docker-compose; then
    echo "docker-compose was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "Docker ($(docker -v))"
DocumentInstalledItem "Docker Compose ($(docker-compose -v))"