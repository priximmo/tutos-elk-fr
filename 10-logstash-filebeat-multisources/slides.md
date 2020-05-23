%title: ELK
%author: xavki


# Filebeat : Input autres

<br>
* liste des input

```
    Azure eventhub
    Cloud Foundry
    Container
    Docker
    Google Pub/Sub
    HTTP JSON
    Kafka
    Log
    MQTT
    NetFlow
    Office 365 Management Activity API
    Redis
    s3
    Stdin
    Syslog
    TCP
    UDP
```

<br>
* container : idem input log + stream (all/stdout/stderr...)

```
- type: container
  paths: 
    - '/var/lib/docker/containers/*/*.log'
```
