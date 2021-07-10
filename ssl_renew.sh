#!/bin/bash

COMPOSE="/usr/local/bin/docker-compose --no-ansi"
DOCKER="/usr/bin/docker"

cd /home/ubuntu/node_project/
$COMPOSE -f docker-compose-production.yaml run certbot renew --dry-run && $COMPOSE kill -s SIGHUP explorer-frontend
$DOCKER system prune -af