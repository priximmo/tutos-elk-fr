while true; do curl -XPOST "127.0.0.1:9200/vid38-index/_doc?pretty" -H 'Content-Type: application/json' -d'{"name":"monid", "data": true}'; done
