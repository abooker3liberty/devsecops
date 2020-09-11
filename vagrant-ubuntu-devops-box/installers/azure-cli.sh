#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Test
if ! command -v az; then
  echo "azure-cli was found"
  exit 1
fi

# Document
DocumentInstalledItem "Azure CLI ($(az -v | head -n 1))"