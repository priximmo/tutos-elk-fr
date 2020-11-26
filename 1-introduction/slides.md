%title: ELK
%author: xavki


# ELK : Introduction et Principes


<br>


* ELK : Elasticsearch + Logstash + Kibana

* Stack ELK : 3 outils combinés (avec des variations possibles EFK...)

<br>


* Collecte d'informations et restitution (logs, métriques et pas que)

<br>


* SIEM : Security Information and Event Management

<br>


* le plus populaire

<br>


* xpack = version payante 

--------------------------------------------------------------------------------

# ELK : Qui fait quoi ???


<br>


* Elasticsearch : 
		* base de données nosql (distribuées)
		* fortes volumétries
		* spécialiste recherche plain text
		* index/sharding/replicas
		* moteur Lucene (2Mds de docs limite)
		* api format rest (json)

<br>


* Logstash :
		* ETL (Extract Transform Load)
		* Input/Filter/Output
		* nombreux plugin d'entrée (nginx, postgres...)
		* filtres et grok

<br>


* Kibana :
		* Visualisation et Requêtes
		* spécialiste des données Elasticsearch (management etc)
		* Dashboard
		* concurrence à grafana

--------------------------------------------------------------------------------

# ELK : Une chaîne


<br>




		LOGSTASH  >>  ELASTICSEARCH  >>  KIBANA


<br>


* variations : les beats (filebeat, mettricbeat...)
