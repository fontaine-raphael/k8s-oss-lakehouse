#!/bin/bash
# Starts the local Minikube cluster using predefined environment variables

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load environment variables if not already set
if [ -f "$SCRIPT_DIR/minikube.env" ]; then
  echo "🔧 Loading environment variables from minikube.env..."
  source "$SCRIPT_DIR/minikube.env"
fi

echo "🚀 Starting Minikube with the following configuration:"
echo "Driver:        ${MINIKUBE_DRIVER}"
echo "CPUs:          ${MINIKUBE_CPUS}"
echo "Memory (MB):   ${MINIKUBE_MEMORY}"
echo "Disk Size:     ${MINIKUBE_DISK_SIZE}"
echo "K8s Version:   ${MINIKUBE_K8S_VERSION}"

minikube start \
  --driver="${MINIKUBE_DRIVER}" \
  --cpus="${MINIKUBE_CPUS}" \
  --memory="${MINIKUBE_MEMORY}" \
  --disk-size="${MINIKUBE_DISK_SIZE}" \
  --kubernetes-version="${MINIKUBE_K8S_VERSION}"

echo "✅ Minikube cluster started successfully."
