#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Installing Kubernetes Base Infrastructure..."

kubectl apply -f base/namespaces.yaml
kubectl apply -f base/network-policy.yaml
kubectl apply -f base/resource-quota.yaml
kubectl apply -f base/limit-range.yaml

echo "📦 Installing ingress-nginx..."
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  -n ingress-nginx --create-namespace \
  -f base/ingress-nginx.yaml

echo "🔐 Installing cert-manager..."
helm repo add jetstack https://charts.jetstack.io
helm upgrade --install cert-manager jetstack/cert-manager \
  -n cert-manager --create-namespace \
  -f base/cert-manager.yaml \
  --set crds.enabled=true

echo "📊 Installing metrics-server..."
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

echo "✅ Kubernetes base infrastructure successfully installed!"
