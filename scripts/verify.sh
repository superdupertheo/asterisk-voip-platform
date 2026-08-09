#!/usr/bin/env bash
set -Eeuo pipefail

NAMESPACE="voip"
DEPLOYMENT="asterisk"

kubectl wait \
  --namespace "${NAMESPACE}" \
  --for=condition=available \
  "deployment/${DEPLOYMENT}" \
  --timeout=180s

POD_NAME="$(kubectl get pods \
  --namespace "${NAMESPACE}" \
  --selector app=asterisk \
  --output jsonpath='{.items[0].metadata.name}')"

kubectl exec --namespace "${NAMESPACE}" "${POD_NAME}" -- \
  asterisk -rx "core show version"

kubectl exec --namespace "${NAMESPACE}" "${POD_NAME}" -- \
  asterisk -rx "pjsip show endpoints"

kubectl exec --namespace "${NAMESPACE}" "${POD_NAME}" -- \
  asterisk -rx "core show uptime"

echo "Asterisk checks passed."
