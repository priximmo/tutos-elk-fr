%title: ELK
%author: xavki


# ElasticSearch : Cerebro


<br>


* manipuler elasticsearch par des curl ~ évident

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


* exemple : CEREBRO | https://github.com/lmenezes/cerebro

```
docker run -d --name cerebro -p 9000:9000 lmenezes/cerebro
```
