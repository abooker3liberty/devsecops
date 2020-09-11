#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Test
if ! command -v helm; then
  echo "helm was not found"
  exit 1
fi

# Document
DocumentInstalledItem "helm ($(helm version --short |& head -n 1))"