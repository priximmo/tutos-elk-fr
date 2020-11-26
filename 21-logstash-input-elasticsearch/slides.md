%title: ELK
%author: xavki


# LOGSTASH : INPUT PLUGIN ELASTICSEARCH


<br>


* récupérer des infos d'un index :

```
curl 127.0.0.1:9200/_cat/indices
curl 127.0.0.1:9200/filebeat*/_search
curl 127.0.0.1:9200/filebeat*/_search?_source_includes=message | jq
```


```
input {
  elasticsearch {
    hosts => "127.0.0.1"
    index => "filebeat*"
    docinfo => true
    size => 1
  }
}
output {
  file {
    path => "/tmp/ouput.log"
  }
}
```

PS : logstash boucle...

-----------------------------------------------------------------------------------

# LOGSTASH : INPUT PLUGIN ELASTICSEARCH


<br>


* test avec elasticsearch en output cf fichier joint

<br>


* docinfo => true		> informations complémentaires index/type/id

<br>


* docinfo_fields => ["_index"] > filtrer les info de docinfo

<br>


* schedule => "0 * * * *"  > check croné

<br>


* scroll => "1m"  > maintien de la requête pendant une durée

<br>


* size => 1000		> nombre d'éléments ramenés

<br>


* add_fields / tags / type

<br>


* query (cf demo)

-----------------------------------------------------------------------------------

# LOGSTASH : INPUT PLUGIN ELASTICSEARCH


<br>


* ajouter une query pour filtrer

```
curl -XPOST 127.0.0.1:9200/metricbeat*/_search -H 'Content-Type: application/json' -d "@query.json"
```

```
{
    "query":{
        "match":{
          "system.process.cgroup.cpuacct.id" : "docker.service"
      }
    }
}
```



