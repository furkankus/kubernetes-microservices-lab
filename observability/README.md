# Observability Stack

Enterprise-grade observability stack for Kubernetes clusters.

## Components

- Prometheus – Metrics collection
- Grafana – Visualization & dashboards
- Loki – Log aggregation
- Tempo – Distributed tracing

## Features

- Cluster monitoring
- Application metrics
- Centralized logging
- Distributed tracing
- Alerting & notifications

## Logs & Tracing

- Loki: Centralized logging
- Tempo: Distributed tracing

This setup enables full request tracing across microservices.

## Installation

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm upgrade --install loki grafana/loki-stack \
  -n monitoring \
  -f helm-values/loki-stack.yaml./install.sh

```bash
helm upgrade --install tempo grafana/tempo \
  -n monitoring \
  -f helm-values/tempo.yaml

