#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

## Install git
add-apt-repository ppa:git-core/ppa -y
apt-get update -y
apt-get install --no-install-recommends git -y

# Install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get install -y --no-install-recommends git-lfs

# Run tests to determine that the software installed as expected
echo "Testing git installation"
if ! command -v git; then
    echo "git was not installed"
    exit 1
fi
echo "Testing git-lfs installation"
if ! command -v git-lfs; then
    echo "git-lfs was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "Git ($(git --version 2>&1 | cut -d ' ' -f 3))"
DocumentInstalledItem "Git Large File Storage (LFS) ($(git-lfs --version 2>&1 | cut -d ' ' -f 1 | cut -d '/' -f 2))"