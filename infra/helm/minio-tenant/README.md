# 📘 MinIO Tenant

This folder contains the configuration and scripts for deploying a **MinIO Tenant** using Helm and the MinIO Operator.

---

## 📦 Overview

A **MinIO Tenant** is a MinIO cluster managed by the Operator.  
This setup provisions:

- A MinIO Tenant with 1 pod (pool-0) and 1 PVC for local testing  
- Initial buckets via `values.yaml` (e.g., `bronze`, `silver`, `gold`)  
- Automatic **port-forwarding** for Console (HTTP) and S3 API  
- PID and log management for clean uninstall  

---

## 📋 Requirements

- MinIO Operator installed and running  
- **kubectl**, **Helm**, and **yq**  
- Optional: **mc (MinIO Client)** for S3 API testing

---

## 🚀 Deployment

### 1️⃣ Install Tenant

```bash
./install-tenant.sh
