%title: ELK
%author: xavki


# ELK : installation Elasticsearch


<br>



* nosql : atout principal c'est la facilité à disposer d'un système distribué

<br>


Principaux:

* elasticsearch : capacité/qualité d'indexation et donc de recherche

* cassandra : gros volumes

* mongodb : la plus polyvalente

* redis : in memory donc très rapide (requêtage limité)

<br>


Elasticsearch :
  * indexation de tous les mots des documents
  * qualité de la recherche
    - TF (Terme Frequency) : fréquence des mots
    - IDF (Inverse Difference Frequency) : moins un mot est commun plus il a de poids dans la recherche

----------------------------------------------------------------------------------------

# ELK : installation Elasticsearch


<br>


* Cluster : ensemble de serveurs (noeuds ayant elasticsearch / même id de cluster)
      - communication via port 9300
      - haute dispo : perfomance et redondance

<br>


* Noeuds : serveur ayant un service elastic
      - différents type : master, data, client...

<br>


* Index : une instance de base de données
      - un à plusieurs par serveur (et cluster)

<br>


* Shards: découpage logique d'un index (un à plusieurs shards)
      - répartition des shards sur plusieurs noeuds (répartir un index)
      - joue sur les performances
      - ajout d'un noeud = réaffectation des shards
      - important pour déterminer nb max de noeuds

<br>


* Réplicas : réplicas de shards d'un index
      - redondance
      - mais aussi performance (interrogeables)

<br>


* requête : via API et somme des résultats de tous les shards


------------------------------------------------------------------------------------------


# ELK : installation Elasticsearch


<br>


* via les packages

* via docker

<br>


* sur debian 

```
sudo wget --directory-prefix=/opt/ https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.6.1-amd64.deb
sudo dpkg -i /opt/elasticsearch*.deb
# edit /etc/elasticsearch/elasticsearch.yml
# host.name + master
#network.host: 0.0.0.0
#discovery.seed_hosts: ["127.0.0.1", "192.168.20.102"]
systemctl enable elasticsearch
systemctl start elasticsearch
```

<br>


* sur centos

```
sudo firewall-cmd --add-port=9200/tcp --permanent
sudo yum install -y wget
sudo wget --directory-prefix=/opt/ https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.6.1-x86_64.rpm
sudo rpm -ivh /opt/elasticsearch*.rpm
# edit /etc/elasticsearch/elasticsearch.yml
# host.name + master
#network.host: 0.0.0.0
#discovery.seed_hosts: ["127.0.0.1", "192.168.20.102"]
systemctl enable elasticsearch
systemctl start elasticsearch
```

------------------------------------------------------------------------------------


# ELK : installation Elasticsearch


<br>


* docker :

```
https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
```

<br>


* check

```
curl -X GET "localhost:9200/_cat/nodes?v&pretty"
```
