#!/bin/bash
set -e


# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Docker Compose
DOCKER_COMPOSE_VERSION=$(curl -sX GET "https://api.github.com/repos/docker/compose/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]')
curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Testing docker-compose installation"
if ! command -v docker-compose; then
    echo "docker-compose was not installed"
    exit 1
fi

DocumentInstalledItem "Docker Compose ($(docker-compose -v))"
