%title: ELK
%author: xavki


# APM : Application Performance Monitoring


<br>


* APM :
		* métriques systèmes : cpu, mémoire...
		* métriques spécifiques :pods, container
		* données applicatives : requêtes applicatives et spans
		* stacktrace et erreurs
		* logs
		* alerting sur seuil (mail possible)

<br>


* configuration (similaire filebeat) :
		* output : elasticsearch, kafka...
		* tls/ssl
		* log dans un fichier
		* jaeger : tracing
		* Real User Monitoring = javascript (capture partie navigateur)

<br>


* principe :
		app > lib apm > server local APM > elasticsearch > kibana

-------------------------------------------------------------------------------------------------

# APM : Application Performance Monitoring



<br>


* installation d'un service (ex : api)

```
sudo apt install python3-pip
pip3 install elastic-apm flask
```


<br>


* installation du server APM

```
wget --directory-prefix /opt/ https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
sudo dpkg -i /opt/apm*.deb
```

<br>


* configuration à minima elasticsearch



