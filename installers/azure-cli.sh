#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

# Install Azure CLI (instructions taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
apt-get update -y
apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list
apt-get update -y
apt-get install azure-cli -y

# Run tests to determine that the software installed as expected
echo "Testing az installation"
if ! command -v az; then
    echo "azure-cli was not installed"
    exit 1
fi

# Document to README
DocumentInstalledItem "Azure CLI ($(az -v | head -n 1))"
