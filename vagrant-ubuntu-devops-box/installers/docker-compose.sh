#!/bin/bash
set -e

# Source helpers
source $HELPER_SCRIPTS/document.sh

# Install
DOCKER_COMPOSE_VERSION=$(curl -sX GET "https://api.github.com/repos/docker/compose/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]')
curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Test
if ! command -v docker-compose; then
  echo "docker-compose was not found"
  exit 1
fi

# Document
DocumentInstalledItem "Docker Compose ($(docker-compose -v))"