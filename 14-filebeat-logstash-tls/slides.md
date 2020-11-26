%title: ELK
%author: xavki


# Filebeat et Logstash : TLS

<br>


* encryption entre filebeat et logstash = éviter des injections

<br>


SUR LE SERVEUR LOGSTASH

* édition conf ssl

```
cp /etc/ssl/openssl.cnf custssl.cnf
[ v3_ca ]
subjectAltName = IP: 192.168.20.102
```

```
openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash.key -out logstash.crt -config custom_custssl.cnf
chown logstash logstash.*
chmod 600 logstash.*
mv logstash.* /etc/logstash/
```

<br>


cf fichier de nginx.conf pour utilisation

```
input {
  beats {
    port => 5044
    ssl => true
    ssl_certificate => "/etc/logstash/logstash.crt"
    ssl_key => "/etc/logstash/logstash.key"
  }
}
```

---------------------------------------------------------------------------------------------------------------


# Filebeat et Logstash : TLS


<br>


* copie du crt /etc/filebeat/logstash.crt (600)

* test

```
curl -v --cacert /etc/filebeat/logstash.crt https://192.168.20.102:5044
```

<br>


* conf filebeat

```
output.logstash:
  hosts: ["192.168.20.102:5044"]
  ssl:
    certificate_authorities: ["/etc/filebeat/logstash.crt"]
```
