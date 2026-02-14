# Kubernetes Base Infrastructure

This module provides production-grade Kubernetes cluster baseline configuration.

## Components

- Namespace isolation (dev, prod, monitoring)
- Ingress controller (NGINX)
- Automated TLS management (cert-manager)
- Metrics Server for autoscaling
- Network policies for zero-trust networking
- Resource quota & limit range enforcement

## Goals

- Secure-by-default cluster setup
- High availability ingress traffic management
- Automated certificate provisioning
- Horizontal pod autoscaling readiness
- Network isolation between workloads
- Cost & resource governance

## Architecture Overview

```text
[ Client ]
     |
     v
[ Ingress Controller ]
     |
     v
[ Kubernetes Services ]
     |
     v
[ Microservices Pods ]
