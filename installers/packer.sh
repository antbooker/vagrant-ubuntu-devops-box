#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Packer
PACKER_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/packer | jq -r .current_version)
curl -LO "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"
unzip -o "packer_${PACKER_VERSION}_linux_amd64.zip" -d /usr/local/bin
rm -f "packer_${PACKER_VERSION}_linux_amd64.zip"

# Run tests to determine that the software installed as expected
echo "Testing packer installation"
if ! command -v packer; then
    echo "packer was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "Packer ($(packer --version))"
