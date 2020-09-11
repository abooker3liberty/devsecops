#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

## Install Python
apt-get update
apt-get install -y --no-install-recommends \
  python \
  python-dev \
  python-pip

# Test
for cmd in python pip; do
  if ! command -v $cmd; then
    echo "$cmd was not found"
    exit 1
  fi
done

# Document
DocumentInstalledItem "Python ($(python --version 2>&1))"
DocumentInstalledItem "pip ($(pip --version))"