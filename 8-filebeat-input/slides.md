%title: ELK
%author: xavki


# Filebeat : Input Logs


<br>


* volet input de type log

* doc : https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-input-log.html

* options : (multiples blocs logs)
		* enabled : activation
		* paths : chemin (avec ou sans \*)
		* fields : champs additionnels (environnement...)
		* recursive_glob.enabled : récursif "massif" (8 niveaux) grâce à \*\*
		* include_lines
		* exclude_lines
		* json : autre vidéo
		* exclude_files : fichiers exclus
		* ignore_older : ignorer les fichiers modifié il y a plus de x (dhs)
		* règles de clotures
		* symlinks : suivre les liens symboliques
		* tags
		* index : si elasticsearch output

-----------------------------------------------------------------------------------------


```
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/nginx/access*.log
  exclude_lines: ["^127.0.0.1"]
  exclude_files: [".gz$"]
  ignore_older: 24h
  tags: ["back"]
  fields:
    env: prod
    owner: xavki
```
