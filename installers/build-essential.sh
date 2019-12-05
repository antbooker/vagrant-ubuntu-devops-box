#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

# Install build-essential
apt-get update -y
apt-get install --no-install-recommends build-essential -y

# Document to README.md
DocumentInstalledItem build-essential
