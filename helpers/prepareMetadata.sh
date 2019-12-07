#!/bin/bash

source /vagrant/helpers/document.sh

rm /vagrant/README.md
AddTitle "Vagrant Ubuntu Bionic 18.04 DevOps Box for VirtualBox"
WriteItem "## Usage"
WriteItem ""
WriteItem "Install [VirtuaBox](https://www.virtualbox.org/) & [Vagrant](https://www.vagrantup.com/)."
WriteItem ""
writeItem "```"
WriteItem "vagrant up"
WriteItem "vagrant ssh"
WriteItem "```"
WriteItem "***"
WriteItem "The following software will be installed as of $(date '+%d/%m/%Y %H:%M:%S')"
WriteItem "***"
