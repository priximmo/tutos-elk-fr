%title: ELK
%author: xavki


# ElasticSearch : Mapping & Insert


<br>


* créer le mapping d'un index

```
curl -X PUT http://192.168.20.102:9200/utilisateurs \
-H 'Content-Type: application/json' \
-d '{
      "mappings": {
        "dynamic": "strict",
        "properties": {
          "nom": {"type": "text"},
          "ville": {"type": "text"}
        }
      }
}'
```

<br>


* types de champs: https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-types.html
		* text vs keyword > full text vs filtering/ordering 

-------------------------------------------------------------------------------------------------

# ElasticSearch : Mapping


<br>


* ajouter un document : méthode classique (1 à 1)

```
curl -XPOST -H 'Content-Type: application/json' 192.168.20.102:9200/utilisateurs/_doc \
-d '{"nom": "xavier", "ville": "caen"}'
```

Rq : cf jq

<br>


* ajouter des documents dans un même index : méthode bulk (plusieurs en une fois)

```
curl -XPOST -H 'Content-Type: application/x-ndjson' 192.168.20.102:9200/utilisateurs/_doc/_bulk --data-binary '
{"index": {}}
{"nom": "xavier", "ville": "caen"}
{"index": {}}
{"nom": "pierre", "ville": "paris"}
{"index": {}}
{"nom": "paul", "ville": "bordeaux"}
'
```

-------------------------------------------------------------------------------------------------

# ElasticSearch : Mapping


<br>


<br>


* bulk dans différents index

```
curl -XPOST -H 'Content-Type: application/x-ndjson' 192.168.20.102:9200/_bulk --data-binary '
{"index": {"_index": "idx1"}}
{"nom": "xavier", "ville": "caen"}
{"index": {"_index": "idx2"}}
{"nom": "pierre", "ville": "paris"}
{"index": {"_index": "idx3"}}
{"nom": "paul", "ville": "bordeaux"}
'
```

<br>


* mise à jour d'une donnée

```
curl 192.168.20.102:9200/idx1/_search
curl -XPOST -H 'Content-Type: application/json' 192.168.20.102:9200/idx1/_update/yYuGcXMB2gO-mUGBPXo5 \
-d '{ "doc" :{"nom": "xavki", "ville": "berlin"} }'
```
