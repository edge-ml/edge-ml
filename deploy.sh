#!/usr/bin/env bash
set -e

# Deploy the production stack (edge-ml.org).
#
# Like beta (see deploy-beta.sh), production no longer builds the app services
# from source. Each submodule's CI publishes pre-built `tecokit/edge-ml_*:latest`
# images to Docker Hub on every push to the `main` branch; this script pulls
# those images and recreates the running containers. Watchtower on the box keeps
# them updated between manual deploys.
#
# Exception: firmwareCompile publishes no image, so `arduino-compiler` is still
# built from source here.

git config --global --add safe.directory /home/ubuntu/edge-ml

cd /home/ubuntu/edge-ml

# Refresh the compose file / configs from the main branch of the superproject.
git checkout main
sudo -u ubuntu git pull

# firmwareCompile has no published image, so keep its source up to date for the
# local build of arduino-compiler below.
cd firmwareCompile
git checkout main
sudo -u ubuntu git pull
cd ..

# Pull the latest production images from Docker Hub. `pull` is essential:
# `up -d` alone reuses the existing local image and would NOT pick up a newly
# published one. `--ignore-pull-failures` tolerates arduino-compiler, which has
# no image to pull.
docker-compose -f docker-compose-production.yaml pull --ignore-pull-failures

# Rebuild the one service that ships no image, then (re)start the stack.
docker-compose -f docker-compose-production.yaml build arduino-compiler
docker-compose -f docker-compose-production.yaml up -d --remove-orphans
