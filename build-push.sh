#!/bin/bash
set -euo pipefail

IMAGE=registry.rich0.org/public/docker-duplicity

docker build . --pull --no-cache --tag "${IMAGE}:latest"
docker push "${IMAGE}:latest"
