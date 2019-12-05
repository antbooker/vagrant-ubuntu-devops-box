#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

# Install Subversion
apt-get install --no-install-recommends subversion -y

# Run tests to determine that the software installed as expected
echo "Testing subversion installation"
if ! command -v svn; then
    echo "Subversion (svn) was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "Subversion ($(svn --version | head -n 1))"