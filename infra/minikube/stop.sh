#!/bin/bash
# Stops and deletes the local Minikube cluster

echo "🛑 Stopping and deleting the Minikube cluster..."
minikube delete
echo "✅ Minikube cluster deleted."
