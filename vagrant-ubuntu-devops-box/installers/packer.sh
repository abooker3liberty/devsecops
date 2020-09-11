#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
PACKER_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/packer | jq -r .current_version)
curl -LO "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"
unzip -o "packer_${PACKER_VERSION}_linux_amd64.zip" -d /usr/local/bin
rm -f "packer_${PACKER_VERSION}_linux_amd64.zip"

# Test
if ! command -v packer; then
  echo "packer was not found"
  exit 1
fi

# Document
DocumentInstalledItem "Packer ($(packer --version))"