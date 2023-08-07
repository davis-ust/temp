helm repo add grafana https://grafana.github.io/helm-charts &&
  helm repo update &&
  helm upgrade --install grafana-k8s-monitoring grafana/k8s-monitoring \
    --namespace "default" --create-namespace --values - <<EOF
cluster:
  name: "my-cluster"

externalServices:
  prometheus:
    host: "METRICS_HOST"
    basicAuth:
      username: "METRICS_USERNAME"
      password: "glc_eyJvIjoiOTE4NDkyIiwibiI6ImF6dXJlLWxpbi0wLTYiLCJrIjoiMjJzVnIyM3dWRHgxWDE5Y0VqMjJFWDNiIiwibSI6eyJyIjoidXMtYXp1cmUifX0="

  loki:
    host: "LOGS_HOST"
    basicAuth:
      username: "LOGS_USERNAME"
      password: "glc_eyJvIjoiOTE4NDkyIiwibiI6ImF6dXJlLWxpbi0wLTYiLCJrIjoiMjJzVnIyM3dWRHgxWDE5Y0VqMjJFWDNiIiwibSI6eyJyIjoidXMtYXp1cmUifX0="

opencost:
  opencost:
    prometheus:
      external:
        url: "METRICS_HOST/api/prom"
EOF
