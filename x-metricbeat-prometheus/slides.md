%title: ELK
%author: xavki


# LOGSTASH : INPUT PLUGIN  TWITTER


<br>


metricbeat.modules:
- module: prometheus
  metricsets: ["collector"]
  enabled: true
  period: 10s
  hosts: ["localhost:9090"]
  #metrics_path: /metrics
  #namespace: example



metricbeat.modules:
- module: prometheus
  period: 10s
  hosts: ["&lt;prometheus_url&gt;"]
  metrics_path: '/federate'
  query:
    'match[]': '{__name__!=""}'
  namespace: example


metricbeat.modules:
- module: prometheus
  metricsets: ["stats"]
  enabled: true
  period: 10s
  hosts: ["localhost:9090"]
  #metrics_path: /metrics
  #namespace: example
