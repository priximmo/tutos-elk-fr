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

---------------------------------------------------------------------

# Filebeat : Exemple container


<br>


* container : idem input log + stream (all/stdout/stderr...)

```
- type: container
  paths: 
    - '/var/lib/docker/containers/*/*.log'
```

* logstash

fichier joint

---------------------------------------------------------------------

# Filebeat : Input autres


<br>


* tcp : test via netcat

```
filebeat.inputs:
- type: tcp
  max_message_size: 10MiB
  host: "localhost:9000"
```

* logstash

fichier joint

* netcat 

```
echo "champs1 champs2 champs3" | nc 127.0.0.1 9000
```
