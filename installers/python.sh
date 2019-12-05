#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

## Install Python, Python 3, pip, pip3
apt-get install --no-install-recommends python python-dev python-pip python3 python3-dev python3-pip -y

# Run tests to determine that the software installed as expected
echo "Testing python2 pip2 python3 pip3"
for cmd in python pip python3 pip3; do
    if ! command -v $cmd; then
        echo "$cmd was not installed or not found on PATH"
        exit 1
    fi
done

# Document to README.md
DocumentInstalledItem "Python ($(python --version 2>&1))"
DocumentInstalledItem "pip ($(pip --version))"
DocumentInstalledItem "Python3 ($(python3 --version))"
DocumentInstalledItem "pip3 ($(pip3 --version))"
