#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

## Install
add-apt-repository -y \
  ppa:git-core/ppa
apt-get update
apt-get install -y --no-install-recommends \
  git

# Test
if ! command -v git; then
  echo "git was not installed"
  exit 1
fi

# Document
DocumentInstalledItem "Git ($(git --version 2>&1 | cut -d ' ' -f 3))"