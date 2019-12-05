#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

## Install kubectl
apt-get install apt-transport-https -y
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update -y
apt-get install kubectl -y

## Install Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Run tests to determine that the software installed as expected
echo "Testing kubectl installation"
if ! command -v kubectl; then
    echo "kubectl was not installed"
    exit 1
fi
echo "Testing helm installation"
if ! command -v helm; then
    echo "helm was not installed"
    exit 1
fi

# Document to README.md
DocumentInstalledItem "kubectl ($(kubectl version --short |& head -n 1))"
DocumentInstalledItem "helm ($(helm version --short |& head -n 1))"
