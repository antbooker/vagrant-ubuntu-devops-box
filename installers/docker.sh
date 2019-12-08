#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Docker
curl -sSL https://get.docker.com/ | bash

# Run tests to determine that the software installed as expected
echo "Testing docker installation"
if ! command -v docker; then
    echo "docker was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "Docker ($(docker -v))"
