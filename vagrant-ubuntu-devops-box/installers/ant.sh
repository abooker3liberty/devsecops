#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
apt-get update
apt-get install --no-install-recommends -y \
  ant \
  ant-optional
echo "ANT_HOME=/usr/share/ant" | tee -a /etc/environment

# Test
if ! command -v ant; then
  echo "ant was not found"
  exit 1
fi

# Document
DocumentInstalledItem "Ant ($(ant -version))"