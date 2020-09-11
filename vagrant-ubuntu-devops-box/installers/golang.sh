#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# This function installs Go using the specified arguments:
#   $1=MajorVersion (1.14)
#   $2=MajorAndMinorVersion (1.14.3)
#   $3=IsDefaultVersion (true or false)
function InstallGo () {
  curl -sL https://dl.google.com/go/go$2.linux-amd64.tar.gz -o go$2.linux-amd64.tar.gz
  mkdir -p /usr/local/go$1
  tar -C /usr/local/go$1 -xzf go$2.linux-amd64.tar.gz --strip-components=1 go
  rm go$2.linux-amd64.tar.gz
  echo "GOROOT_${1//./_}_X64=/usr/local/go$1" | tee -a /etc/environment
  # Document
  DocumentInstalledItem "Go $1 ($(/usr/local/go$1/bin/go version))"

  # If this version of Go is to be the default version,
  # symlink it into the path and point GOROOT to it.
  if [ $3 = true ]
  then
    ln -s /usr/local/go$1/bin/* /usr/bin/
    echo "GOROOT=/usr/local/go$1" | tee -a /etc/environment
  fi
}

# Install
InstallGo 1.13 1.13.11 false
InstallGo 1.14 1.14.3 true