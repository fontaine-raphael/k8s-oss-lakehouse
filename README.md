# 🧪 k8s-oss-lakehouse

A minimal, self-hosted **Lakehouse architecture** powered by Kubernetes and open-source tools.  
Built for **learning**, **experimentation**, and **personal development**.

---

## 📌 Overview

This project aims to build a **local Kubernetes-based Lakehouse MVP** that simulates a modern data platform architecture, using open-source components only.

The entire stack is orchestrated in a local Kubernetes cluster via **Minikube**, allowing reproducible and isolated testing environments for learning key concepts such as:

- Data ingestion and streaming
- Distributed processing
- Transactional data lake storage
- SQL querying across heterogeneous data
- Dashboarding and data visualization

---

## 💠 Architecture

```
[Python Script] --> [Kafka] --> [Spark] --> [Iceberg on MinIO] --> [Trino] --> [Superset]
```

All services run as pods within the local Kubernetes cluster, with persistent storage provisioned through host volumes. Internal communication occurs via Kubernetes services.

---

## 🛠️ Tech Stack

| Component        | Purpose                                               |
|------------------|--------------------------------------------------------|
| `Docker`         | Containerization and base layer                       |
| `Minikube`       | Local Kubernetes cluster                              |
| `Helm`           | Package manager for deploying charts                  |
| `Apache Kafka`   | Streaming platform for message ingestion              |
| `Apache Spark`   | Stream and batch data processing                      |
| `MinIO`          | S3-compatible object storage                          |
| `Apache Iceberg` | Transactional table format for the data lake          |
| `Trino`          | Distributed SQL query engine                          |
| `Superset`       | Open-source data exploration and dashboarding         |
| `Python`         | Workload simulation with synthetic streaming data     |

---

## 🧑‍💻 Development Guidelines

### ✅ Commit Conventions

This project enforces [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) using `commitlint` and `husky`.

**Example formats:**
```bash
feat(kafka): add Kafka Helm chart
fix(spark): correct schema inference bug
docs: update README with architecture diagram
chore: configure lint hooks for commits
```

### ✅ Branch Strategy

| Branch Type   | Purpose                                    |
|---------------|--------------------------------------------|
| `main`        | Stable version, only updated via PRs       |
| `dev`         | General housekeeping and setup experiments |
| `feature/*`   | Feature-specific development branches      |

> PRs are mandatory for merging into `main`. Feature branches are preferred for isolating work.

---

## 🚀 Getting Started

### ✅ Prerequisites

- Docker
- Git
- Minikube
- Helm
- Python (for workload simulation)
- macOS, Linux, or WSL2-enabled Windows

> 📦 Optional: Use [Homebrew](https://brew.sh/) to install CLI tools

---

### 🔧 Local Setup

```bash
# Install Node.js dependencies and enable commit linting
npm install
```

> Check the project board on GitHub Projects for ongoing tasks and progress.

---

## 📁 Project Board

📌 GitHub Project: [`Lakehouse MVP Roadmap`](https://github.com/users/fontaine-raphael/projects/2/views/1)

Columns:

- `Planning`: High-level ideas, architectural decisions, and potential features.
- `Not Started`: Tasks with defined scope but not yet prioritized or initiated.
- `Building`: Work currently in progress.
- `Done`: Completed tasks or milestones.
- `Archived`: Dropped items, paused efforts, or references for future use.

---

## 🤝 Contributions

This is a personal learning project, but feedback and suggestions are welcome via Issues or Discussions.

> Please follow the commit and branch guidelines if contributing.

---

## 🪪 License

This project is licensed under the [MIT License](./LICENSE).

---

## ✍️ Author

**Raphael Fontaine**  
[GitHub Profile](https://github.com/fontaine-raphael)
