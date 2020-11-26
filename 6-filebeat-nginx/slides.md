%title: ELK
%author: xavki


# Filebeat : exemple nginx


<br>


* filebeat = beat

* action régulière de push si nécessaire

* filebeat > envoi de fichier dans elasticsearch

* interaction avec elasticsearch (injection data) 

* interaction avec kibana (management des index) 

* existe d'autres beats

* filebeat possède des modules : ex. nginx

* retient où il en est


------------------------------------------------------------------------


# Filebeat : exemple nginx


<br>


* installation

```
wget --directory-prefix /opt/ https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
sudo dpkg -i /opt/filebeat*.deb
```

<br>


* module filebeat

```
sudo filebeat modules enable nginx
sudo filebeat modules list
```


