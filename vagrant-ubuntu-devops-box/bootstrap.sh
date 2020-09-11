#!/bin/bash
# remove comment if you want to enable debugging
#set -x

set -e
  ### Tony boot run ###
       echo "---- set locale"
          sudo locale-gen en_US.utf8 || true
          sudo update-locale LANG=en_US.UTF-8
          sudo /bin/bash -c 'echo "export LANG=en_US.UTF-8" >> /etc/skel/.bashrc'

        echo "---- Update and Upgrade"
          sudo apt-get install unattended-upgrades
          sudo unattended-upgrade -d -v
          sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
          sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
          sudo DEBIAN_FRONTEND=noninteractive apt-get -y install apt-transport-https
          sudo DEBIAN_FRONTEND=noninteractive apt-get -y install curl p7zip-full jq docker.io git awscli
          sudo usermod --append --groups docker ubuntu

    # Add the Cloud SDK distribution URI as a package source
        echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    # Import the Google Cloud public key
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    # Update the package list and install the Cloud SDK
        sudo apt-get -y update && sudo apt-get -y install google-cloud-sdk

    # Update the package list and install the Cloud SDK
        curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
   ### Tony boot run ###

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
