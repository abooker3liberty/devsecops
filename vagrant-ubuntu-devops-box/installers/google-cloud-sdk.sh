#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
  google-cloud-sdk

# Test
if ! command -v gcloud; then
  echo "google cloud sdk was not found"
  exit 1
fi

# Document
DocumentInstalledItem "Google Cloud SDK ($(gcloud --version | head -n 1 | cut -d ' ' -f 4))"