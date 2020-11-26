%title: ELK
%author: xavki


# ElasticSearch : Rolling Upgrade


<br>


* 3 noeuds : 7.6.1 > 7.8.0

* doc : https://www.elastic.co/guide/en/elasticsearch/reference/current/rolling-upgrades.html

0. Check version

```
curl -X GET "localhost:9200/_cat/nodes?h=ip,name,version&v&pretty"
```

1. shard allocation timeout

curl -X PUT "localhost:9200/_cluster/settings?pretty" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "primaries"
  }
}
'

2. non essential
curl -X POST "localhost:9200/_flush/synced?pretty"


3. machine learning job
curl -X POST "localhost:9200/_ml/set_upgrade_mode?enabled=true&pretty"

4. installation .deb

5. restart

6. check

7. réactivation

curl -X PUT "localhost:9200/_cluster/settings?pretty" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": null
  }
}
'

8. Etat du recovery

curl -X GET "localhost:9200/_cat/recovery?pretty"

9. Réactivation du ML

curl -X POST "localhost:9200/_ml/set_upgrade_mode?enabled=false&pretty"


