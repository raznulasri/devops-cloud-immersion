#!/bin/bash
set -euo pipefail

# Install Docker Engine and the Compose plugin
curl -fsSL https://get.docker.com | sh

# Allow SSM sessions to use Docker without sudo
id ssm-user &>/dev/null || useradd -m ssm-user
usermod -aG docker ssm-user

# Make sure the SSM agent is running (preinstalled on Canonical Ubuntu AMIs)
snap start amazon-ssm-agent || true

# Run Rackula with the official compose file (web UI on port 8080)
mkdir -p /opt/rackula
cd /opt/rackula
curl -fsSL https://raw.githubusercontent.com/RackulaLives/Rackula/main/deploy/docker-compose.persist.yml -o docker-compose.yml
mkdir -p data
chown 1001:1001 data

docker compose up -d
