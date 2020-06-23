curl -s -XPUT 'http://127.0.0.1:9200/_ilm/policy/vid38-policy' -H 'Content-Type: application/json' -d '
{
  "policy": {                       
    "phases": {
      "hot": {                      
        "actions": {
          "rollover": { 
            "max_docs": "10",
            "max_age": "30s"
          }
        }
      },
      "delete": {
        "min_age": "60s",           
        "actions": {
          "delete": {}              
        }
      }
    }
  }
}
'

curl -s -XGET 'http://127.0.0.1:9200/_ilm/policy/vid38-policy?pretty'

