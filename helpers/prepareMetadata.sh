#!/bin/bash

source /vagrant/helpers/document.sh

rm /vagrant/README.md
AddTitle "Vagrant Ubuntu Bionic 18.04 DevOps Box"
WriteItem "The following software will be installed on your workstation as of $(date '+%d/%m/%Y %H:%M:%S')"
WriteItem "***"
