%title: ELK
%author: xavki


# ElasticSearch : Sauvegardes et Restauration

<br>


doc : https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshot-restore.html

<br>


* nécessité de déclarer et créer un repo

```
mkdir -p /home/vagrant/bck
chown -R elasticsearch:elasticsearch /home/vagrant/bck
chmod 775 /home/vagrant/bck
```

* ajout à la conf elasticsearch

```
path.repo: ["/home/vagrant/bck"]
systemctl restart elasticsearch
```

<br>


* déclaration du repo

```
curl -X PUT "localhost:9200/_snapshot/my_backup?pretty" -H 'Content-Type: application/json' -d'
{
  "type": "fs",
  "settings": {
  "location": "/home/vagrant/bck",
    "compress": true
  }
}
'
```

* check

```
curl -X GET "localhost:9200/_snapshot/my_backup?pretty"
```

```
curl -X PUT "localhost:9200/_snapshot/my_unverified_backup?verify=false&pretty" -H 'Content-Type: application/json' -d'
{
  "type": "fs",
  "settings": {
    "location": "my_unverified_backup_location"
  }
}
'
```

* backup

```
curl -X PUT "localhost:9200/_snapshot/my_backup/snapshot_1?wait_for_completion=true&pretty" -H 'Content-Type: application/json' -d'
{
  "indices": "utilisateurs",
  "ignore_unavailable": true,
  "include_global_state": false,
  "metadata": {
    "taken_by": "xavki",
    "taken_because": "parce que jai peur"
  }
}
'
```

PS : pas obliger de faire un backup partiel


* lister les snapshots

```
curl 127.0.0.1:9200/_cat/snapshots/my_backup
```


* restauration

```
curl -X POST "localhost:9200/_snapshot/my_backup/snapshot_1/_restore?pretty"
```

PS : si restauration partiel penser à clore l'index




* remove snapshot

```
curl -X DELETE "localhost:9200/_snapshot/my_backup/snapshot_1?pretty"
```
