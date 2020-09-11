#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
apt-get update
apt-get install -y --no-install-recommends \
  httpie

# Test
if ! command -v http; then
  echo "httpie was not found"
  exit 1
fi

# Document
DocumentInstalledItem "HTTPie ($(http --version))"