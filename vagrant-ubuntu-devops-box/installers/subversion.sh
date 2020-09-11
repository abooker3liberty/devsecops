#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
apt-get update
apt-get install -y --no-install-recommends \
  subversion

# Test
if ! command -v svn; then
  echo "Subversion was not found"
  exit 1
fi

# Document
DocumentInstalledItem "Subversion ($(svn --version | head -n 1))"