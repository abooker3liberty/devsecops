#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

## Install
apt-get update
apt-get install -y --no-install-recommends \
  mysql-client

# Tests
if ! command -v mysql; then
  echo "mysql client was not found"
  exit 1
fi

# Document
DocumentInstalledItem "MySQL Client ($(mysql --version))"