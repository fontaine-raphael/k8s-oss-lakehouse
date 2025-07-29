#!/bin/bash
set -e

# Load shared config
source "$(dirname "$0")/tenant.env"

# Automatically derive pool name from values.yaml (fallback to env if set)
POOL_NAME="${POOL_NAME:-$(yq '.tenant.pools[0].name' "$VALUES_FILE")}"
STATEFULSET="${RELEASE_NAME}-${POOL_NAME}"


# Stop Console port-forward if running
if [ -f "$CONSOLE_PID_FILE" ]; then
  echo "🛑 Stopping Console port-forward (PID $(cat $CONSOLE_PID_FILE))..."
  kill "$(cat $CONSOLE_PID_FILE)" 2>/dev/null || true
  rm -f "$CONSOLE_PID_FILE" "$CONSOLE_LOG_FILE"
fi

# Stop API port-forward if running
if [ -f "$API_PID_FILE" ]; then
  echo "🛑 Stopping API port-forward (PID $(cat $API_PID_FILE))..."
  kill "$(cat $API_PID_FILE)" 2>/dev/null || true
  rm -f "$API_PID_FILE" "$API_LOG_FILE"
fi

echo "🗑️ Uninstalling MinIO Tenant '$RELEASE_NAME'..."
helm uninstall "$RELEASE_NAME" -n "$NAMESPACE" || true

echo "🗑️ Deleting namespace '$NAMESPACE'..."
kubectl delete namespace "$NAMESPACE" --ignore-not-found

echo "✅ MinIO Tenant uninstalled successfully!"
