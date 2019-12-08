#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install 7-Zip
apt-get update
apt-get install -y --no-install-recommends \
  p7zip \
  p7zip-full \
  p7zip-rar

# Document to README.md
DocumentInstalledItem "7-Zip $(7z i | head --lines=2 | cut -d ' ' -f 3 | tr -d '\n')"
