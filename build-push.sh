#!/bin/bash
set -euo pipefail

IMAGE=registry.rich0.org/public/docker-duplicity

regctl image copy  "${IMAGE}:latest" "${IMAGE}:previous"
docker build . --pull --no-cache --tag "${IMAGE}:latest"
docker push "${IMAGE}:latest"
