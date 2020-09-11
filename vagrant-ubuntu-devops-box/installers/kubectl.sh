#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

## Install
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y --no-install-recommends \
  kubectl

# Test
if ! command -v kubectl; then
  echo "kubectl was not found"
  exit 1
fi

# Document
DocumentInstalledItem "kubectl ($(kubectl version --short |& head -n 1))"