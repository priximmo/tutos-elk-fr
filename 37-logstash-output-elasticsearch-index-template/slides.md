%title: ELK
%author: xavki


# LOGSTASH : OUTPUT - ELASTICSEARCH


<br>


* mapping : structure des documents/index

* caractéristiques,noms des champs, sharding, réplicas...

<br>


* sans template > elastic et logstash font ce qu'ils veulent (valeurs par défaut...)

* peux poser des problème pour exploiter les datas

* par exemple : si changement de type d'une journée sur l'autre...

* template = définition

* dynamic mapping : true / false / strict


------------------------------------------------------------------------------------------------


# LOGSTASH : OUTPUT - ELASTICSEARCH


<br>


* création du mapping dans Elasticsearch au lancement de logstash

```
output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => "xavki-%{+YYYY.MM.dd}"
    manage_template => true
    template => "/etc/logstash/test.json"
    template_name => "xavki"
  }
}
```

