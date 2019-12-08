#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Ansible PPA and latest Ansible
add-apt-repository -y \
  ppa:ansible/ansible
apt-get update
apt-get install -y --no-install-recommends \
  ansible

# Run tests to determine that the software installed as expected
echo "Testing ansible installation"
if ! command -v ansible; then
    echo "Ansible was not installed or found on PATH"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "Ansible ($(ansible --version |& head -n 1))"