#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
DEFAULT_JDK_VERSION=8
apt-add-repository -y ppa:openjdk-r/ppa
apt-get update
apt-get install -y --no-install-recommends \
  openjdk-8-jdk \
  openjdk-11-jdk \
  openjdk-12-jdk \
  openjdk-13-jdk \
  openjdk-14-jdk
update-alternatives --set java /usr/lib/jvm/java-${DEFAULT_JDK_VERSION}-openjdk-amd64/jre/bin/java
echo "JAVA_HOME_8_X64=/usr/lib/jvm/java-8-openjdk-amd64" | tee -a /etc/environment
echo "JAVA_HOME_11_X64=/usr/lib/jvm/java-11-openjdk-amd64" | tee -a /etc/environment
echo "JAVA_HOME_12_X64=/usr/lib/jvm/java-12-openjdk-amd64" | tee -a /etc/environment
echo "JAVA_HOME_13_X64=/usr/lib/jvm/java-13-openjdk-amd64" | tee -a /etc/environment
echo "JAVA_HOME_14_X64=/usr/lib/jvm/java-14-openjdk-amd64" | tee -a /etc/environment
echo "JAVA_HOME=/usr/lib/jvm/java-${DEFAULT_JDK_VERSION}-openjdk-amd64" | tee -a /etc/environment
echo "JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8" | tee -a /etc/environment

# Test
for ver in 8 11 12 13 14; do
  if ! command /usr/lib/jvm/java-$ver-openjdk-amd64/bin/java -version; then
    echo "java $ver was not found"
    exit 1
  fi
done

# Document
DocumentInstalledItem "OpenJDK (8) ($(/usr/lib/jvm/java-8-openjdk-amd64/bin/java -version |& head -n 1))"
DocumentInstalledItem "OpenJDK (11) ($(/usr/lib/jvm/java-11-openjdk-amd64/bin/java -version |& head -n 1))"
DocumentInstalledItem "OpenJDK (12) ($(/usr/lib/jvm/java-12-openjdk-amd64/bin/java -version |& head -n 1))"
DocumentInstalledItem "OpenJDK (13) ($(/usr/lib/jvm/java-13-openjdk-amd64/bin/java -version |& head -n 1))"
DocumentInstalledItem "OpenJDK (14) ($(/usr/lib/jvm/java-14-openjdk-amd64/bin/java -version |& head -n 1))"