%title: ELK
%author: xavki


# ElasticSearch : SHARDING


<br>


* sharding = distribution des datas sur le cluster

<br>


* shard = 1 primaire + X replicas

<br>


* index = 1 à plusieurs shards

<br>


* 1 à plusieurs shards = 1 noeud

* shards > noeuds de type "datas" (à minima)

<br>


* confugration faite à la création de l'index uniquement (ou en général sur le cluster)
		* resharding = réindexation

* au contraire de la réplication qui peut être modifiée après la création dde l'indexation

-----------------------------------------------------------------------------------------------------------------

# ElasticSearch : SHARDING


<br>


* attention : le nombre doit être à minima cohérent avec l'étendu de votre cluster
		* ex : 1 index / 1 shard et 1 replica de 1 >> 2 noeuds (3 aucun intérêt)
		* noeud 1 > S1
		* noeud 2 > R1
		* noeud 3 > ??

<br>


* 2 noeuds > index 3 shards > 3P + 3R
		* noeud1 > P1 + P2 + R3
		* noeud2 > R1 + R2 + P3

* si augmentation du cluster de 1 noeud :
		* noeud1 > P1 + R3 
		* noeud2 > R2 + P3
		* noeud3 > P2 + R1

-----------------------------------------------------------------------------------------------------------------

# ElasticSearch : SHARDING


<br>


* gros index > peu de shards > facile à identifier > problème d'affectation (suivant la taille)

<br>


* préférer de petits index (ex : un par jour) > plus petit index > plus facile à affecter

<br>


*  et avantage : si vos index augmentent avec le temps > changement du sharding des futurs index

* principe du lego à ranger dans une boite

<br>


* trop d'index et trop de shards > plus de consommation de ressources (trop d'éclatement des requêtes)

```
Since a shard is essentially a Lucene index, it consumes file handles, memory, and CPU resources.
```

* trop de shard sur un même noeud > trop de demande pour un même hardware

<br>


* shard < 50GB et < 40% de la taille d'un noeud

-----------------------------------------------------------------------------------------------------------------

# ElasticSearch : SHARDING



<br>


* stats :

```
curl 127.0.0.1:9200/_cluster/stats?pretty
curl 127.0.0.1:9200/_cluster/stats/nodes/xavki1?pretty
```

<br>


* index : 

```
curl 127.0.0.1:9200/_cat/indices
```

<br>



```
curl 127.0.0.1:9200/_cat/shards
```
