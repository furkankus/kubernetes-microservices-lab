#!/usr/bin/env bash

echo "🔥 Removing Kubernetes base infrastructure..."

helm uninstall ingress-nginx -n ingress-nginx || true
helm uninstall cert-manager -n cert-manager || true

kubectl delete ns ingress-nginx cert-manager dev prod monitoring || true

echo "🧹 Cleanup completed"
