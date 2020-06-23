curl -XPUT "127.0.0.1:9200/%3Cvid38-index-%7Bnow%2Fd%7BYYYYMMdd%7D%7D-1%3E?pretty" -H 'Content-Type: application/json' -d'
{
  "aliases": {
    "vid38-index": {
      "is_write_index": true
    }
  }
}'

curl -XGET 'http://127.0.0.1:9200/_cat/indices?v'
