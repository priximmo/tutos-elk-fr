%title: ELK
%author: xavki


# LOGSTASH : OUTPUT - ELASTICSEARCH - Partie 1


<br>


* ILM : Index Lifecycle Mamangement > 6.7

* ILM = gestion dans le temps des donnée par les index

<br>


* différents degrés
		* Hot : récent, alimenté et interrogé
		* Warm : pas de mise à jour mais interrogé
		* Cold : pas de mise à jour, peu interrogé mais on en a besoin (stockage lent)
		* Delete : plus besoin, supprimé

<br>


* Plusieurs éléments nécessaires :
		* Policies : les règles de lifecycle
		* Template : pour produire les nouveaux index (c'est mieux)
		* un alias

Rq : 

```
indices.lifecycle.poll_interval: 10s
```

* alias => lien symbolique qui permet d'injecter les datas dans le dernier index

* principe de rolling
		* <nom_index>-000001
		* <nom_index>-000002
		* <nom_index>-000003
		* <nom_index>-000004

-----------------------------------------------------------------------

# LOGSTASH : OUTPUT - ELASTICSEARCH - Partie 1


<br>


* cf fichiers
