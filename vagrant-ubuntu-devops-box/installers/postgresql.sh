#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
apt-get update
apt-get install -y --no-install-recommends \
  libpq-dev \
  postgresql-client

# Test

# Document to README.md
DocumentInstalledItem "$(psql -V 2>&1 | cut -d ' ' -f 1,2,3)"