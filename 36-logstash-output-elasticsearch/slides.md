%title: ELK
%author: xavki


# LOGSTASH : OUTPUT - ELASTICSEARCH


<br>


* ELK > output le plus répanu

<br>


* beaucoup d'options

<br>


* minima :

```
output {
  elasticsearch {
    hosts => "[127.0.0.1:9200]"
    index => "pg-tb2"
  }
}
```
----------------------------------------------------------------------------------------------


# LOGSTASH : OUTPUT - ELASTICSEARCH


<br>


* éclater en plusieurs index

```
    filter {
      if [log_type] in [ "test", "staging" ] {
        mutate { add_field => { "[@metadata][target_index]" => "test-%{+YYYY.MM}" } }
      } else if [log_type] == "production" {
        mutate { add_field => { "[@metadata][target_index]" => "prod-%{+YYYY.MM.dd}" } }
      } else {
        mutate { add_field => { "[@metadata][target_index]" => "unknown-%{+YYYY}" } }
      }
    }
    output {
      elasticsearch {
        hosts => ["127.0.0.1:9200"]
        index => "%{[@metadata][target_index]}"
      }
    }
```

----------------------------------------------------------------------------------------------


# LOGSTASH : OUTPUT - ELASTICSEARCH


<br>


* hosts : liste des machines du cluster (load-balancing, sans les master)

* index : nom ou template de nom avec variable "logstash-%{+yyyy.MM.dd}"

* compression : gzip compression des requêtes

* document_id : défintion d'un id unique par document (champs à définir)


* action :
	* index : un évènement = un document à indexer
	* delete: un évènement = un document à supprimer (document_id)
	* create: un évènement est unique (clef primaire => document_id)
	* update: mise à jour d'un document (rare et délicat)

* certs

* password : accès à un ES sécurisé

* pool_max : nombre de connexion max

* retry

* bulk



------------------------------------------------------------------------------------------------


# LOGSTASH : OUTPUT - ELASTICSEARCH


<br>


* ILM : index lifecyle management > rotate

* template management : persistence dans la structure des index


