#!/usr/bin/env bash
set -Eeuo pipefail

IMAGE_NAME="${IMAGE_NAME:-localhost/asterisk-voip}"
IMAGE_TAG="${IMAGE_TAG:-1.0.0}"

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

podman build \
  --file "${PROJECT_ROOT}/container/Containerfile" \
  --tag "${IMAGE_NAME}:${IMAGE_TAG}" \
  "${PROJECT_ROOT}/container"

podman image inspect "${IMAGE_NAME}:${IMAGE_TAG}" >/dev/null

echo "Built image: ${IMAGE_NAME}:${IMAGE_TAG}"
