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

# Run tests to determine that the software installed as expected
echo "Testing docker installation"
if ! command -v docker; then
    echo "docker was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "Docker ($(docker -v))"
