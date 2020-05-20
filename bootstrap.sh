#!/bin/bash
set -e

export HELPER_SCRIPTS=/vagrant/helpers
export INSTALLER_SCRIPTS=/vagrant/installers
export METADATA_FILE=/vagrant/README.md

# Source helpers
bash ${HELPER_SCRIPTS}/prepareMetadata.sh

# Pre-Req installers
bash ${INSTALLER_SCRIPTS}/basic.sh
bash ${INSTALLER_SCRIPTS}/build-essential.sh
bash ${INSTALLER_SCRIPTS}/java.sh
bash ${INSTALLER_SCRIPTS}/python2.sh
bash ${INSTALLER_SCRIPTS}/python3.sh

# Installers
bash ${INSTALLER_SCRIPTS}/7-zip.sh
bash ${INSTALLER_SCRIPTS}/ansible.sh
bash ${INSTALLER_SCRIPTS}/ant.sh
bash ${INSTALLER_SCRIPTS}/aws-cli.sh
bash ${INSTALLER_SCRIPTS}/azcopy7.sh
bash ${INSTALLER_SCRIPTS}/azcopy10.sh
bash ${INSTALLER_SCRIPTS}/azure-cli.sh
bash ${INSTALLER_SCRIPTS}/azure-cli-extensions.sh
bash ${INSTALLER_SCRIPTS}/docker.sh
bash ${INSTALLER_SCRIPTS}/docker-compose.sh
bash ${INSTALLER_SCRIPTS}/git.sh
bash ${INSTALLER_SCRIPTS}/git-lfs.sh
bash ${INSTALLER_SCRIPTS}/golang.sh
bash ${INSTALLER_SCRIPTS}/google-cloud-sdk.sh
bash ${INSTALLER_SCRIPTS}/gradle.sh
bash ${INSTALLER_SCRIPTS}/httpie.sh
bash ${INSTALLER_SCRIPTS}/kubectl.sh
bash ${INSTALLER_SCRIPTS}/helm.sh
bash ${INSTALLER_SCRIPTS}/maven.sh
bash ${INSTALLER_SCRIPTS}/mysql.sh
bash ${INSTALLER_SCRIPTS}/packer.sh
bash ${INSTALLER_SCRIPTS}/postgresql.sh
bash ${INSTALLER_SCRIPTS}/subversion.sh
bash ${INSTALLER_SCRIPTS}/terraform.sh

# Cleanup
bash ${INSTALLER_SCRIPTS}/cleanup.sh