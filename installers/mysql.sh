#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

## Install MySQL Client
apt-get update
apt-get install -y --no-install-recommends \
  mysql-client

# Run tests to determine that the software installed as expected
echo "Testing mysql installation"
if ! command -v mysql; then
    echo "mysql was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "MySQL ($(mysql --version))"
