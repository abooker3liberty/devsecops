#!/bin/bash
set -e

function WriteItem {
  if [ -z "$METADATA_FILE" ]; then
    echo "METADATA_FILE environment variable must be set to output to Metadata Document!"
    return 1;
  else
    echo -e "$1" | tee -a "$METADATA_FILE"
  fi
}

function AddTitle {
  WriteItem "# $1"
}

function AddSubTitle {
  WriteItem "## $1"
}

function DocumentInstalledItem {
  WriteItem "- $1"
}

function DocumentInstalledItemIndent {
  WriteItem "  - $1"
}