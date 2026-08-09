#!/usr/bin/env bash
set -Eeuo pipefail
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
K8S_DIR="${PROJECT_ROOT}/kubernetes"
kubectl apply -f "${K8S_DIR}/namespace.yml"
kubectl apply -f "${K8S_DIR}/secret.yml"
kubectl apply -f "${K8S_DIR}/configmap.yml"
kubectl apply -f "${K8S_DIR}/pvc.yml"
kubectl apply -f "${K8S_DIR}/deployment.yml"
kubectl apply -f "${K8S_DIR}/service.yml"
kubectl rollout status deployment/asterisk \
  --namespace voip \
  --timeout=180s
kubectl get pods,services,pvc --namespace voip
