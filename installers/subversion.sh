#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Subversion
apt-get install -y --no-install-recommends \
  subversion

# Run tests to determine that the software installed as expected
echo "Testing subversion installation"
if ! command -v svn; then
    echo "Subversion (svn) was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "Subversion ($(svn --version | head -n 1))"