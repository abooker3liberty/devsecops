#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
apt-get update
apt-get install -y --no-install-recommends \
  build-essential

# Test

# Document
DocumentInstalledItem build-essential