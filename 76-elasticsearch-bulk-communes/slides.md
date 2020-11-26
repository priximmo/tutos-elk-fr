%title: ELK
%author: xavki


# ElasticSearch : Bulk

<br>


https://www.data.gouv.fr/fr/datasets/r/5c219016-1eaf-41dc-9bba-2f32dfb71b72

<br>


* création du mapping

```
{
      "settings": {
        "number_of_shards": 3,
        "number_of_replicas": 2
      },
      "mappings": {
        "dynamic": "strict",
        "properties": {
          "departement_code": {"type": "text"},
          "ville": {"type": "text"},
          "code_postal": {"type": "text"},
          "location": {
            "type": "geo_point"
          }
        }
      }
}
```

```
curl -X PUT http://192.168.20.102:9200/communes -H "Content-Type: application/json" -d @mapping.json
```

<br>


* création du fichier d'injection des datas

```
cat cities.json | jq '.[] | .department_code + ";" + .name + ";" + .zip_code + ";" + (.gps_lng|tostring) + ";" + (.gps_lat|tostring) ' | tr -d '"' |awk -F ";" '{print "{ \"index\": {\"_index\":\"communes\"}} \n {\"departement_code\":\""$1"\",\"ville\":\""$2"\",\"code_postal\":\""$3"\",\"location\":["$4","$5"]}"}'
```

<br>


* pousser les données

```
curl -s -H "Content-Type: application/x-ndjson" -XPOST 192.168.20.101:9200/_bulk --data-binary @new.json
```

<br>


* afficher plus de 10000 éléments

```
"index.max_result_window" : "10000000"
```
