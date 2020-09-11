#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

## Install
apt-get update
apt-get install -y --no-install-recommends \
  python3 \
  python3-dev \
  python3-pip

# Tests
for cmd in python3 pip3; do
  if ! command -v $cmd; then
    echo "$cmd was not found"
    exit 1
  fi
done

# Document
DocumentInstalledItem "Python3 ($(python3 --version))"
DocumentInstalledItem "pip3 ($(pip3 --version))"