#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
add-apt-repository -y \
  ppa:ansible/ansible
apt-get update
apt-get install -y --no-install-recommends \
  ansible

# Test
if ! command -v ansible; then
  echo "Ansible was not found"
  exit 1
fi

# Document
DocumentInstalledItem "Ansible ($(ansible --version |& head -n 1))"