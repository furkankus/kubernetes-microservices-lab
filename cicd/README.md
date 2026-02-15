# CI/CD Pipelines

This module provides enterprise-grade CI/CD pipelines using:

- GitHub Actions
- Azure DevOps Pipelines

## Features

- Automated build
- Docker image creation
- Image scanning (planned)
- Helm-based deployment
- GitOps compatible workflows

## Pipeline Flow

```text
Commit → Build → Test → Docker Build → Push → Deploy
