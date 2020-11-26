%title: ELK
%author: xavki


# Filebeat : injection logstash


<br>


Filebeat

* désactivation module nginx

```
filebeat modules disable nginx
```

* édition de l'input /etc/filebeat/filebeat.yml

```
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/nginx/access.log
```

* édition de l'output /etc/filebeat/filebeat.yml

```
output.logstash:
  hosts: ["192.168.20.102:5044"]
```

----------------------------------------------------------------

# Filebeat : injection logstash


<br>


* configuration de logstash (idem vidéo 5) : modification input

```
input {
  beats {
    port => 5044
  }
}
```

* cf fichier de conf nginx.conf
