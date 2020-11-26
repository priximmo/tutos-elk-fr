%title: ELK
%author: xavki


# ElasticSearch : ElasticHQ


<br>


* changer le nombre de replicas

```
curl -XPUT -H "Content-Type: application/json" 192.168.20.102:9200/filebeat*/_settings -d @file.json
```

```
{
    "index" : {
        "number_of_replicas" : 2
    }
}
```

<br>


* exemple : ElasticHQ | https://github.com/ElasticHQ/elasticsearch-HQ

```
docker run -d --name hq -p 5000:5000 elastichq/elasticsearch-hq
```
