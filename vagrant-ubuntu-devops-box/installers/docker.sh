#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
curl -sSL https://get.docker.com/ | bash

# Test
echo "Testing docker installation"
if ! command -v docker; then
  echo "docker was not installed"
  exit 1
fi

# Document
DocumentInstalledItem "Docker ($(docker -v))"