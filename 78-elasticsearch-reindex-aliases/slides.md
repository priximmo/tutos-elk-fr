%title: ELK
%author: xavki


# ElasticSearch : reindex et aliases


<br>


* un alias = lien symbolique vers un index
		* rendre transparente des opérations
				* ex : lifecycle management
				* ou reindex

<br>


* liste des alias

```
curl 192.168.20.102:9200/_cat/aliases
```

-------------------------------------------------------------------

# ElasticSearch : reindex et aliases

<br>


* création d'un alias

```
{
  "actions": [
    {
      "add": {
        "index": "communes",
        "alias": "myalias"
      }
    }
  ]
}
```

```
curl -XPOST -H 'Content-Type: application/json' http://192.168.20.102:9200/_aliases -d @alias.json
```

```
curl 192.168.20.102:9200/myalias/_search?pretty
```

-------------------------------------------------------------------

# ElasticSearch : reindex et aliases

<br>


* création d'un nouvel index avec nouveau mapping

```
{
      "settings": {
        "number_of_shards": 6,
        "number_of_replicas": 2
      },
      "mappings": {
        "dynamic": "strict",
        "properties": {
          "departement_code": {"type": "text"},
          "ville": {"type": "text"},
          "code_postal": {"type": "text"},
          "location": {"type": "geo_point"}
        }
      }
}
```

```
curl -X PUT http://192.168.20.102:9200/communes2 -H "Content-Type: application/json" -d @index.json
```

-------------------------------------------------------------------

# ElasticSearch : reindex et aliases


<br>


* réindexation

```
{
  "source": {
    "index": "communes"
  },
  "dest": {
    "index": "communes2"
  }
}
```

```
curl -XPOST http://192.168.20.102:9200/_reindex -H "Content-Type: application/json" -d @reindex.json
```

<br>


* déplacement de l'alias

```
{
  "actions": [
    {
      "add": {
        "index": "communes2",
        "alias": "myalias"
      }
    }
  ]
}
```

```
curl 192.168.20.102:9200/myalias/_search?pretty
curl -XDELETE 192.168.20.102:9200/communes/_aliases/myalias
```
