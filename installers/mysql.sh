#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

## Install MySQL Client
apt-get install mysql-client -y

# Run tests to determine that the software installed as expected
echo "Testing mysql installation"
if ! command -v mysql; then
    echo "mysql was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "MySQL ($(mysql --version))"
