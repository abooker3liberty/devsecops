#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
wget -O /tmp/azcopy.tar.gz https://aka.ms/downloadazcopy-v10-linux
tar zxvf /tmp/azcopy.tar.gz --strip-components=1 -C /tmp
mv /tmp/azcopy /usr/local/bin/azcopy10

# Test
if ! command -v azcopy10; then
  echo "azcopy10 was not found"
  exit 1
fi

# Document
DocumentInstalledItem "AzCopy10 (available by azcopy10 alias) $(azcopy10 --version | awk '{print $3}')"