#!/bin/bash
set -e

export HELPER_SCRIPTS=/vagrant/helpers
export INSTALLER_SCRIPTS=/vagrant/installers
export METADATA_FILE=/vagrant/README.md

# Source Helpers
bash ${HELPER_SCRIPTS}/prepareMetadata.sh

# Installers
bash ${INSTALLER_SCRIPTS}/basic.sh
bash ${INSTALLER_SCRIPTS}/build-essential.sh
bash ${INSTALLER_SCRIPTS}/7-zip.sh
bash ${INSTALLER_SCRIPTS}/ansible.sh
bash ${INSTALLER_SCRIPTS}/python.sh
bash ${INSTALLER_SCRIPTS}/aws-cli.sh
bash ${INSTALLER_SCRIPTS}/azure-cli.sh
bash ${INSTALLER_SCRIPTS}/azure-cli-extensions.sh
bash ${INSTALLER_SCRIPTS}/docker.sh
bash ${INSTALLER_SCRIPTS}/docker-compose.sh
bash ${INSTALLER_SCRIPTS}/git.sh
bash ${INSTALLER_SCRIPTS}/golang.sh
bash ${INSTALLER_SCRIPTS}/google-cloud-sdk.sh
bash ${INSTALLER_SCRIPTS}/java-tools.sh
bash ${INSTALLER_SCRIPTS}/kubernetes-tools.sh
bash ${INSTALLER_SCRIPTS}/mysql.sh
bash ${INSTALLER_SCRIPTS}/nodejs.sh
bash ${INSTALLER_SCRIPTS}/packer.sh
bash ${INSTALLER_SCRIPTS}/subversion.sh
bash ${INSTALLER_SCRIPTS}/terraform.sh
