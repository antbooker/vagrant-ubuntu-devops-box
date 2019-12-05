#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

# Install Node.js
curl -sL https://deb.nodesource.com/setup_12.x | bash
apt-get install --no-install-recommends nodejs -y

# Install Yarn repository and key
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update -y

# Install Yarn
apt-get install --no-install-recommends yarn -y

# Run tests to determine that the software installed as expected
echo "Testing node npm installation"
for cmd in node npm yarn; do
    if ! command -v $cmd; then
        echo "$cmd was not installed or not found on PATH"
        exit 1
    fi
done

# Document to README.md
DocumentInstalledItem "Node.js ($(node --version))"
DocumentInstalledItemIndent "npm ($(npm --version))"
DocumentInstalledItem "Yarn ($(yarn --version))"
