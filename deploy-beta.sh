#!/usr/bin/env bash
set -e

# Deploy the beta stack (beta.edge-ml.org).
#
# Unlike production (see deploy.sh), beta does NOT build from source. The CI
# in each submodule publishes pre-built `tecokit/edge-ml_*_beta:latest` images
# to Docker Hub on every push to the `beta` branch. This script just pulls
# those images and recreates the running containers.

git config --global --add safe.directory /home/ubuntu/edge-ml

cd /home/ubuntu/edge-ml

# Refresh the compose file / configs from the beta branch of the superproject.
git checkout beta
sudo -u ubuntu git pull

# Pull the latest beta images from Docker Hub and (re)start the stack.
# `pull` is essential: `up -d` alone reuses the existing local image and would
# NOT pick up a newly published one.
docker-compose -f docker-compose-beta.yaml pull
docker-compose -f docker-compose-beta.yaml up -d --remove-orphans
