#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

# Install AWS CLI
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
set +e
./aws/install
set -e
rm awscliv2.zip
rm -rf aws

# Run tests to determine that the software installed as expected
echo "Testing aws installation"
if ! command -v aws2; then
    echo "aws2 was not installed or found on PATH"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "AWS CLI ($(aws2 --version 2>&1))"
