#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Run tests to determine that the software installed as expected
echo "Testing az installation"
if ! command -v az; then
    echo "azure-cli was not installed"
    exit 1
fi

# Document to README
DocumentInstalledItem "Azure CLI ($(az -v | head -n 1))"
