%title: ELK
%author: xavki


# Filebeat : Output Logstash

<br>


* loadbalancing

```
output.logstash:
  hosts: ["192.168.20.102:5044", "192.168.20.106:5044"]
  loadbalance: true
```

<br>


* compression_level

* worker : nombre de worker par host

* escape_html : échape html

* pipelining : nombre de batch lancé sans attendre le ACK

* index : nom de l'index

* timeout

* max_retries

* ssl
