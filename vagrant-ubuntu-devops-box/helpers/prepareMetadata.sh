#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

rm /vagrant/README.md
AddTitle "Vagrant Ubuntu Bionic 18.04 DevOps Box for VirtualBox"
WriteItem "## Usage"
WriteItem ""
WriteItem "Install [VirtuaBox](https://www.virtualbox.org/) & [Vagrant](https://www.vagrantup.com/)."
WriteItem ""
WriteItem "***"
WriteItem "The following software will be installed as of $(date '+%d/%m/%Y %H:%M:%S')"
WriteItem "***"