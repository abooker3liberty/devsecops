#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
DEFAULT_MVN_VERSION=3.6.3
curl -sL https://www-eu.apache.org/dist/maven/maven-3/"${DEFAULT_MVN_VERSION}"/binaries/apache-maven-"${DEFAULT_MVN_VERSION}"-bin.zip -o maven.zip
unzip -o -d /usr/share maven.zip
rm maven.zip
ln -sf /usr/share/apache-maven-"${DEFAULT_MVN_VERSION}"/bin/mvn /usr/bin/mvn
echo "M2_HOME=/usr/share/apache-maven-${DEFAULT_MVN_VERSION}" | tee -a /etc/environment

# Test
if ! command -v mvn; then
  echo "maven was not found"
  exit 1
fi

# Document
DocumentInstalledItem "Maven ($(mvn -version | head -n 1))"