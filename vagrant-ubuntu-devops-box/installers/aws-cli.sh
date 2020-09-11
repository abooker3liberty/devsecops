#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install && \
rm awscliv2.zip && \
rm -rf aws

# Test
if ! command -v aws; then
  echo "aws was not found"
  exit 1
fi

# Document
DocumentInstalledItem "AWS CLI ($(aws --version 2>&1))"