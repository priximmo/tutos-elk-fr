%title: ELK
%author: xavki


# ElasticSearch : Premiers curl ;)


<br>


* index > shards | replicas > documents > fields

<br>


* santé du cluster

```
curl -XGET 127.0.0.1:9200/_cluster/health
```

<br>


* on repart d'un filebeat/nginx pour la démo

```
apt install nginx
wget --directory-prefix /opt/ https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
dpkg -i /opt/filebeat*.deb
filebeat modules enable nginx
systemctl enable filebeat
systemctl start filebeat
```

---------------------------------------------------------------------------------

# ElasticSearch : Premiers curl ;)


<br>


* quelques verbes utiles :

GET : récupérer des datas
POST : mise à jour de datas
PUT : création de datas
DELETE : suppression

<br>


* lister les index

```
curl -XGET 192.168.20.102:9200/_cat/indices
```

<br>


* lister les documents d'un index

```
curl -XGET 192.168.20.102:9200/filebeat*/_search?pretty
```

<br>


* créer un index

```
curl -XPUT 192.168.20.102:9200/xavki
```

<br>


* créer un document

```
curl -XPUT -H "Content-Type: application/json" http://192.168.20.102:9200/xavki/_doc/1 -d '{ "nom" : "xavier" }'
curl -XGET http://192.168.20.102:9200/xavki/_doc/1
```

<br>


* suppression d'un index

```
curl -XDELETE 192.168.20.107:9200/filebeat*
```

Rq : attention à ce que l'on fait (si wildcard )
