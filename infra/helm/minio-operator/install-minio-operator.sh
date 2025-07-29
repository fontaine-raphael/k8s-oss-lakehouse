#!/bin/bash
set -e

# Load shared config
source "$(dirname "$0")/operator.env"

echo "🚀 Installing MinIO Operator in namespace '$NAMESPACE'..."
helm install "$RELEASE_NAME" minio-operator/operator \
  --namespace "$NAMESPACE" \
  --create-namespace

echo "⏳ Waiting for MinIO Operator pods to be ready..."
kubectl rollout status deployment/minio-operator -n "$NAMESPACE"

echo "✅ MinIO Operator installed successfully!"
kubectl get pods -n "$NAMESPACE"
