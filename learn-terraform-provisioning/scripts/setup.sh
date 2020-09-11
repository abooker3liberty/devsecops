#!/bin/bash
set -x

### Tony boot run ###
echo "---- set locale"
sudo locale-gen en_US.utf8 || true
sudo update-locale LANG=en_US.UTF-8
sudo /bin/bash -c 'echo "export LANG=en_US.UTF-8" >> /etc/skel/.bashrc'

echo "---- Update and Upgrade"
# Add the GCP Cloud SDK distribution URI as a package source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import the GCP public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
# Update the package list and install the GCP Cloud SDK
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
google-cloud-sdk

# Begin unattended package install
sudo unattended-upgrade -d -v
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install apt-transport-https
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install curl p7zip-full jq docker.io awscli
sudo usermod --append --groups docker ubuntu
# Update the package list and install the Azure Cloud SDK
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install necessary dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get -y -qq install curl wget git vim apt-transport-https ca-certificates
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt -y -qq install golang-go

# Setup sudo to allow no-password sudo for "hashicorp" group and adding "terraform" user
sudo groupadd -r hashicorp
sudo useradd -m -s /bin/bash terraform
sudo usermod -a -G hashicorp terraform
sudo cp /etc/sudoers /etc/sudoers.orig
echo "terraform  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/terraform

# Installing SSH key
sudo mkdir -p /home/terraform/.ssh
sudo chmod 700 /home/terraform/.ssh
sudo cp /tmp/UbuntuLTS.pub /home/terraform/.ssh/authorized_keys
sudo chmod 600 /home/terraform/.ssh/authorized_keys
sudo chown -R terraform /home/terraform/.ssh
sudo usermod --shell /bin/bash terraform

# Create GOPATH for Terraform user & download the webapp from github

sudo -H -i -u terraform -- env bash << EOF
whoami
echo ~terraform

cd /home/terraform

export GOROOT=/usr/lib/go
export GOPATH=/home/terraform/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
go get -d github.com/hashicorp/learn-go-webapp-demo
EOF
