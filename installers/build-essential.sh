#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install build-essential
apt-get update
apt-get install -y --no-install-recommends \
  build-essential

# Document to README.md
DocumentInstalledItem build-essential
