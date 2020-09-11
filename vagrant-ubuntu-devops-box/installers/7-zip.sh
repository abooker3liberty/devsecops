#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
apt-get update
apt-get install -y --no-install-recommends \
  p7zip \
  p7zip-full \
  p7zip-rar

# Test
if ! command -v 7z; then
  echo "7-Zip was not found"
  exit 1
fi

# Document
DocumentInstalledItem "7-Zip $(7z i | head --lines=2 | cut -d ' ' -f 3 | tr -d '\n')"