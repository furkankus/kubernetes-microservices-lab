#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="monitoring"

echo "🚀 Starting Observability Stack installation..."

# Namespace oluştur
if ! kubectl get namespace ${NAMESPACE} >/dev/null 2>&1; then
  echo "📦 Creating namespace: ${NAMESPACE}"
  kubectl create namespace ${NAMESPACE}
else
  echo "✅ Namespace ${NAMESPACE} already exists"
fi

echo "📡 Adding Helm repositories..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

echo "📊 Installing Prometheus & Grafana..."
helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
  -n ${NAMESPACE} \
  -f helm-values/kube-prometheus-stack.yaml

echo "📝 Installing Loki (Logging stack)..."
helm upgrade --install loki grafana/loki-stack \
  -n ${NAMESPACE} \
  -f helm-values/loki-stack.yaml

echo "🔍 Installing Tempo (Distributed tracing)..."
helm upgrade --install tempo grafana/tempo \
  -n ${NAMESPACE} \
  -f helm-values/tempo.yaml

echo "🎯 Observability Stack successfully installed!"

echo ""
echo "📌 Useful commands:"
echo "kubectl get pods -n ${NAMESPACE}"
echo "kubectl port-forward svc/monitoring-grafana 3000:80 -n ${NAMESPACE}"
