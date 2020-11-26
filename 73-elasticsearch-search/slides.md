%title: ELK
%author: xavki


# ElasticSearch : Search


<br>


* elasticsearch = recherche full text

<br>


* rechercher dans tous les documents d'un index

```
curl -XGET 192.168.20.102:9200/utilisateurs/_search | jq
curl -XGET 192.168.20.102:9200/utilisateurs/_search?q=pierre | jq
```

<br>



```
curl -XGET -H 'Content-Type: application/json' 192.168.20.102:9200/utilisateurs/_search -d \
'{
  "query": {
    "match": {
      "ville": "paris"
    }
   }
}'
```

<br>


* attention ne recherche pas une phrase composé "caen paris"

```
curl -XGET -H 'Content-Type: application/json' 192.168.20.102:9200/utilisateurs/_search -d \
'{
  "query": {
    "match": { 
      "ville": "caen paris"
    }
   }
}'
```

<br>


* recherche stricte

```
curl -XGET -H 'Content-Type: application/json' 192.168.20.102:9200/utilisateurs/_search -d \
'{
  "query": {
    "match_phrase": {
      "ville": "caen paris"
    }
   }
}'
```

<br>


* multi champs


```
curl -XGET -H 'Content-Type: application/json' 192.168.20.102:9200/utilisateurs/_search -d '{
  "query": {
    "multi_match": {
      "query": "caen",
      "fields": ["nom","ville"]
    }
   }
}'
```

<br>


* avec approximation

```
curl -XGET -H 'Content-Type: application/json' 192.168.20.102:9200/utilisateurs/_search -d '{
  "query": {
    "multi_match": {
      "query": "creu",
      "fields": ["nom","ville"],
      "fuzziness": 2
    }
   }
}'
```

<br>


* rechercher par term exact

```
curl -XGET -H 'Content-Type: application/json' 192.168.20.102:9200/utilisateurs/_search -d '{
  "query": {
    "term": {
      "nom": {
      	"value": "xavier"
      }
    }
  }
}'
```

<br>


* avec approximation

```
curl -XGET -H 'Content-Type: application/json' 192.168.20.102:9200/utilisateurs/_search -d '{
  "query": {
    "fuzzy": {
      "nom": {
        "value": "xoovier"
      }
    }
  }
}'
```
