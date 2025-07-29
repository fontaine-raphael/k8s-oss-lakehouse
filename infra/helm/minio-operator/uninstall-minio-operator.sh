#!/bin/bash
set -e

# Load shared config
source "$(dirname "$0")/operator.env"

echo "🗑️ Uninstalling MinIO Operator..."
helm uninstall "$RELEASE_NAME" -n "$NAMESPACE" || true

echo "🗑️ Deleting namespace '$NAMESPACE'..."
kubectl delete namespace "$NAMESPACE" --ignore-not-found

echo "✅ MinIO Operator uninstalled successfully!"
