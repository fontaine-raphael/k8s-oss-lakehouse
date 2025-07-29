#!/bin/bash
set -e

# Load shared config
source "$(dirname "$0")/tenant.env"

# Automatically derive pool name from values.yaml (fallback to env if set)
POOL_NAME="${POOL_NAME:-$(yq '.tenant.pools[0].name' "$VALUES_FILE")}"
STATEFULSET="${RELEASE_NAME}-${POOL_NAME}"
CONSOLE_SVC="${RELEASE_NAME}-console"
API_SVC="${RELEASE_NAME}-hl"


echo "🚀 Installing MinIO Tenant '$RELEASE_NAME' in namespace '$NAMESPACE'..."
helm install "$RELEASE_NAME" minio-operator/tenant \
  --namespace "$NAMESPACE" \
  --create-namespace \
  --values "$VALUES_FILE"

echo "⏳ Waiting for StatefulSet '$STATEFULSET' to be created..."
found=false
for i in {1..30}; do
  if kubectl get statefulset "$STATEFULSET" -n "$NAMESPACE" &> /dev/null; then
    echo "✅ StatefulSet '$STATEFULSET' found!"
    found=true
    break
  fi
  echo "⏳ Waiting for StatefulSet... ($i/30)"
  sleep 5
done

if [ "$found" = false ]; then
  echo "❌ Timeout waiting for StatefulSet '$STATEFULSET'. Exiting."
  exit 1
fi

echo "⏳ Waiting for MinIO Tenant pods to be ready..."
kubectl rollout status statefulset/"$STATEFULSET" -n "$NAMESPACE"

echo "✅ MinIO Tenant installed successfully!"
kubectl get pods,svc -n "$NAMESPACE"

# Start port-forward for Console in background
echo ""
echo "🔹 Starting port-forward for MinIO Console..."
kubectl port-forward svc/${CONSOLE_SVC} 9090:9090 -n ${NAMESPACE} > "$CONSOLE_LOG_FILE" 2>&1 &
echo $! > "$CONSOLE_PID_FILE"
echo "🔹 Port-forward running in background (PID: $(cat $CONSOLE_PID_FILE))"
echo "🔹 Access the console at: http://localhost:9090"

# Start port-forward for S3 API in background
echo ""
echo "🔹 Starting port-forward for MinIO S3 API..."
kubectl port-forward svc/${API_SVC} 9000:9000 -n ${NAMESPACE} > "$API_LOG_FILE" 2>&1 &
echo $! > "$API_PID_FILE"
echo "🔹 S3 API port-forward running in background (PID: $(cat $API_PID_FILE))"
echo "🔹 Access the S3 API at: http://localhost:9000"
