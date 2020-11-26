%title: ELK
%author: xavki


# Kibana : TLS / HTTPS


<br>


* exemple avec un certificat autosigné / openssl

* utilisation de TLS 1.2

* 2 solutions :
		* kibana seul = sans redirection
		* nginx frontal = avec redirection possible et passwd (si nécessaire)

<br>


SOLUTION KIBANA

* génération du certificat

```
openssl req -x509 -newkey rsa:2048 -nodes -keyout kibana.key -out kibana.crt -days 365
```

<br>


* création d'un répertoire et placement des fichiers

```
mkdir /etc/kibana/certs
mv kibana.crt kibana.key /etc/kibana/certs/
chown kibana:kibana kibana.crt
chown kibana:kibana kibana.key
chmod 400 /etc/kibana/certs/kibana.*
```

<br>


* configuration /etc/kibana/kibana.yml

```
server.ssl.enabled: true
server.ssl.certificate: /etc/kibana/certs/kibana.crt
server.ssl.key: /etc/kibana/certs/kibana.key
server.ssl.certificateAuthorities: /etc/kibana/certs/kibana.crt
server.ssl.supportedProtocols: ["TLSv1.2"]
```

