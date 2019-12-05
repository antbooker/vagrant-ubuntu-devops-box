#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

# Install Ansible PPA and latest Ansible
add-apt-repository ppa:ansible/ansible -y
apt-get update -y
apt-get install --no-install-recommends ansible -y

# Run tests to determine that the software installed as expected
echo "Testing ansible installation"
if ! command -v ansible; then
    echo "Ansible was not installed or found on PATH"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "Ansible ($(ansible --version |& head -n 1))"