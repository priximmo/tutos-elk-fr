%title: ELK
%author: xavki


# LOGSTASH : FILTERS - AGGREGATE


<br>


* aggregate = gestion d'events

* utilisation de map/tableaux pour retravailler des blocs de d'informations
		* ex: plusieurs lignes de logs décrivant un même processus

* utilisation de pseudo "code" spécifique

<br>


* aggregate :
		* task_id : identification du bloc (tâche)
		* aggregate_maps_path : localisation du stockage des maps
		* code : pseudo code exécuté
		* end_of_task : précise la fin de la tache
		* inactivity_timeout : temps pour décider d'office que la tâche est terminée
		* map_action : create / update / create_or_update > status de la map
		* multiples timeout : task_id, code, aggregate...
		* add_field...

---------------------------------------------------------------------------------------

# LOGSTASH : FILTERS - AGREGATE


<br>



