#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
az extension add -n azure-devops

# Test

# Document
DocumentInstalledItem "Azure CLI Extentions:"
DocumentInstalledItemIndent "azure-devops ($(az -v | grep azure-devops))"