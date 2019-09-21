FROM grafana/grafana:5.0.0

RUN mkdir -p /var/lib/grafana/dashboards && mkdir -p /etc/grafana/provisioning/dashboards

COPY dashboards/all_dashboards.yml /etc/grafana/provisioning/dashboards
COPY dashboards/*.json /var/lib/grafana/dashboards/
COPY datasources/prometheus.yml /etc/grafana/provisioning/datasources
