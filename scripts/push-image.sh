#!/usr/bin/env bash
set -Eeuo pipefail
: "${REGISTRY_USER:?Set REGISTRY_USER first}"
: "${REGISTRY_TOKEN:?Set REGISTRY_TOKEN first}"
LOCAL_IMAGE="${LOCAL_IMAGE:-localhost/asterisk-voip:1.0.0}"
REMOTE_IMAGE="${REMOTE_IMAGE:-ghcr.io/${REGISTRY_USER}/asterisk-voip:1.0.0}"
printf '%s' "${REGISTRY_TOKEN}" |
  podman login ghcr.io \
    --username "${REGISTRY_USER}" \
    --password-stdin
podman tag "${LOCAL_IMAGE}" "${REMOTE_IMAGE}"
podman push "${REMOTE_IMAGE}"
echo "Pushed image: ${REMOTE_IMAGE}"
