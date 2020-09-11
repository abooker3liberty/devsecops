#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
wget -O azcopy.tar.gz https://aka.ms/downloadazcopylinux64
tar -xf azcopy.tar.gz
rm azcopy.tar.gz
./install.sh

# Test
if ! command -v azcopy; then
  echo "azcopy7 was not found"
  exit 1
fi

# Document
DocumentInstalledItem "AzCopy7 (available by azcopy alias) $(azcopy --version | awk '{print $2}' | cut -d '-' -f 1)"