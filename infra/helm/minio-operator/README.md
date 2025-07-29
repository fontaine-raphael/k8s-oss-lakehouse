# MinIO Operator

This folder contains the configuration and scripts for deploying the **MinIO Operator** on a Kubernetes cluster using Helm.

---

## 📦 Overview

The **MinIO Operator** is responsible for:

- Managing MinIO Tenants via Custom Resource Definitions (CRDs)
- Automating the provisioning and lifecycle of MinIO clusters (Tenants)
- Handling MinIO Console and S3 API endpoints

This setup is intended for **local development with Minikube** but can be adapted for other clusters.

---

## 📋 Requirements

- **kubectl** v1.24+  
- **Helm** v3.8+  
- **yq** v4.18.1+ (for parsing YAML in scripts)  
- Optional: **mc (MinIO Client)** for S3 API testing

Install prerequisites:

```bash
brew install helm yq
brew install minio/stable/mc
