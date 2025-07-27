# 🚀 Minikube Setup

This folder contains all necessary files to initialize a local Kubernetes cluster using Minikube.

## Contents

- `start.sh`: Shell script to start the cluster with predefined settings.
- `stop.sh`: Script to delete the current cluster.
- `minikube.env`: Environment variables used by the startup script.
- `config.yaml`: Reference configuration for Minikube (not automatically loaded).

## Requirements

- Docker
- Minikube
- kubectl

## Usage

```bash
cd infra/minikube
source minikube.env
./start.sh
