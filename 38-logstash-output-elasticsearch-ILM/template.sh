curl -s -XPUT 'http://127.0.0.1:9200/_template/vid38-index-template' -H 'Content-Type: application/json' -d'{
  "index_patterns": ["vid38-index-*"],                 
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 0,
    "index.lifecycle.name": "vid38-policy",      
    "index.lifecycle.rollover_alias": "vid38-index"    
  },
  "mappings": {
    "properties": {
      "name": {
        "type": "keyword",
        "index": true
      },
      "data": {
        "type": "boolean"
      },
      "timestamp": {
        "type": "date",
        "format": "epoch_millis"
      }
    }
  }
}'


curl -s -XGET 'http://127.0.0.1:9200/_template/vid38-index-template?pretty'
