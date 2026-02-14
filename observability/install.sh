helm repo add grafana https://grafana.github.io/helm-charts
helm upgrade --install loki grafana/loki-stack \
  -n monitoring \
  -f helm-values/loki-stack.yaml

helm upgrade --install tempo grafana/tempo \
  -n monitoring \
  -f helm-values/tempo.yaml
