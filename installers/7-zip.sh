#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

# Install 7-Zip
apt-get update -y
apt-get install --no-install-recommends p7zip p7zip-full p7zip-rar -y

# Document to README.md
DocumentInstalledItem "7-Zip $(7z i | head --lines=2 | cut -d ' ' -f 3 | tr -d '\n')"
