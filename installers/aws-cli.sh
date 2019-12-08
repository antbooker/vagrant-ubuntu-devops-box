#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install the AWS CLI
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm awscli-bundle.zip
rm -rf awscli-bundle

# Run tests to determine that the software installed as expected
echo "Testing aws installation"
if ! command -v aws; then
    echo "aws was not installed or found on PATH"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "AWS CLI ($(aws --version 2>&1))"
